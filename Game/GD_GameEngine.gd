extends Node
class_name GameEngine

# Nodes.
@export var textnode	: RichTextLabel 
@export var effectnode	: Control

# Game Data.
var file 		 : GDScripture
var player 		 : GDPlayer

# Game Progression.
var current_line : int 		= 0
var current_room : GDRoom 	= null
var current_story: GDChain 	= null

var can_progress: bool = true

func _ready():
	clear_lines()
	textnode.connect("meta_clicked", Callable(self,"meta_clicked"))
	set_file(ScriptureGenerator.generate_example_file())
	write("Press the [color=#ff0000]button[/color] to begin.")
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
		return cog.read(file.get_player())
	if cog is cog_branch_edit:
		cog.edit_branch(get_cog_tree(), get_cog_branch())
	if cog is cog_event_player:
		cog.edit_player(file.get_player())
	
	if cog.has_method("read"):
		return cog.read()
	pass

# on dialog branch selected...
func meta_clicked(meta: String):
	if meta.begins_with("_swap_room_"):
		current_room.nearby[int(meta)].enter_room(self)
		can_progress = true
		return
	
	if not meta.is_valid_int():
		return 
	
	current_line = int(meta)
	can_progress = true
#	get_branch().seen_before 	= true
#	get_branch().been_selected 	= true
	write(turn_cog())
	pass

# Set the file. In the future, we'll load files and then set them.
func set_file(new_file, cur_line = -1):
	print(new_file.get_start())
	file   = new_file
	player = new_file.player
	file.get_start().enter_room(self)
	current_line 	= cur_line
	pass

# Progressing through the game.
func next(_skip_to = null):
	print(current_line)
	current_line += 1
	if _skip_to: current_line = _skip_to
	pass

# Write text to game screen.
func write(text: String):
	var old_text = textnode.get_parsed_text()
	textnode.text = "[color=#666666]" + old_text + "[/color]"
	textnode.text += DialogueData.parse(text)
	textnode.text += "\n\n"
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

func write_rooms():
	var gt = ""
	for index in len(current_room.nearby):
		var room = current_room.nearby[index]
		if not room.is_visable:
			continue
		var t = "[url=***]text[/url]"
		var room_name = current_room.nearby[index].name
		room_name = "[color=#ff4411]" + room_name + "[/color]"
		t = t.replace("***", "_swap_room_" + str(index))
		t = t.replace("text", room_name)
		var number_text = "[font_size=20][color=#888]" + str(index) + " - " + "[/color][/font_size]"
		gt += number_text + t + "\n"
	can_progress = false
	write(gt)
	pass

func clear_lines():
	if textnode:
		textnode.clear()
	pass

### checks and getters. ###

func get_story():
	return current_story

func get_room():
	return current_room

func get_cog():
	return get_story().get_cog(current_line)

func get_cog_tree():
	return get_story()[get_cog().inside_tree.back()]

func get_cog_branch() :
	return get_story()[get_cog().inside_branch.back() - 1]

func get_cog_check():
	return get_story()[get_cog().inside_check.back()]

# Check for end of line.
func is_at_end():
	if current_line == get_story().size():
		write_rooms()
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
