extends Node
class_name GameEngine

@export var textnode	: RichTextLabel 
@export var effectnode	: Control
var file 				: GDScripture

var can_progress = true

# Game
var current_line : Array[int] 	= []
var current_story: GDChain 		= null

func _ready():
	clear_lines()
	textnode.connect("meta_clicked", Callable(self,"meta_clicked"))
	set_file(Filehandler.load_file())
	write("Press the [color=#ff0000]button[/color] to begin.")
	print(file)
	print(file.get_starting_story())
	pass

# cogs are the gamedata. 
func turn_cog():
	var cog = get_cog()
	cog.seen_before = true
	
	if cog.has_method("turn"):
		cog.turn()
	
	## cog special functions. Test
	match cog:
		cog_tree_edit:
			print("cog_tree_edit")
		cog_tree:
			print("cog_tree")
		cog_text:
			print("cog_text")
	
	## cog special functions.
	if cog is cog_tree_edit:
		cog.turn(get_cog_tree())
	if cog is cog_branch:
		current_line = cog.inside_tree.back() - 1
	if cog is cog_tree:
		can_progress = false
	if cog is cog_branch_edit:
		cog.edit_branch(get_cog_tree(), get_cog_branch())
	if cog is cog_event_player:
		cog.edit_player(file.get_player(0))
	
	if cog.has_method("read"):
		return cog.read()
	pass

# on dialog branch selected...
func meta_clicked(index):
	# if index != int: it's a greyed out dialog tree branch.
	if not index.is_valid_int():
		return 
	
	current_line[current_line.back()] = int(index)
	can_progress = true
	
#	get_branch().seen_before 	= true
#	get_branch().been_selected 	= true
	
	write(turn_cog())
	pass

# Set the file. In the future, we'll load files and then set them.
func set_file(new_file, cur_line = -1):
	file 			= new_file
	current_story 	= file.get_starting_story()
	current_line 	= [cur_line]
	pass

# Progressing through the game.
func next(_skip_to = null):
	current_line[current_line.back()] += 1
	if _skip_to: current_line[current_line.back()] = _skip_to
	pass

# Write text to game screen.
func write(text: String):
	var old_text  = textnode.get_parsed_text()
	textnode.text = "[color=#666666]" + old_text + "[/color]"
	textnode.text += text + "\n\n"
	pass

# Write the text in the cog or do cog action and skip.
func write_line():
	if get_cog().skip:
		turn_cog()
		next(get_cog().skip_to)
		write_line()
	else:
		write(turn_cog())
	pass

func clear_lines():
	if textnode:
		textnode.clear()
	pass

### EFFECTS ###

# Untested
func set_effect(effect):
	remove_effect()
	effectnode.add_child(effect)
	pass

# Untested
func remove_effect():
	if effectnode.get_child_count() > 0:
		for child in effectnode.get_children():
			child.queue_free()
	pass

### checks and getters. ###

func get_story():
	return file.chains[current_story]

func get_cog():
	return get_story().cogs[current_line]

func get_cog_tree():
	return get_story()[get_cog().inside_tree.back()]

func get_cog_branch() :
	return get_story()[get_cog().inside_branch.back() - 1]

func get_cog_check():
	return get_story()[get_cog().inside_check.back()]

# Check for end of line.
func is_at_end():
	if get_story().size() - 1 == get_cog().line_position and current_line.back() != -1:
		write("Game: end of file")
		return true
	return false

func _input(event):
	if event is InputEventKey or InputEventAction:
		if Input.is_action_just_pressed("ui_accept") and can_progress:
			if is_at_end():
				return 0
			next()
			write_line()
		pass
