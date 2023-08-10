@tool
extends Control

signal selected_index(option)
signal selected_text(option)

signal canceled

signal moved_arrow
signal moved_arrow_up
signal moved_arrow_down

var audioAction: AudioStreamPlayer
var takes_input: bool = true

@export var sound_effect_move	: AudioStream
@export var sound_effect_pressed: AudioStream

class GDItem:
	var sname: 		String = "Penis"
	var value: 		int =   0
	var value_max: 	int =  10
	var value_min: 	int = 	0
	func _init(new_name, new_value = value, new_min = value_min, new_max = value_max):
		value = new_value
		sname = new_name
		if new_min:
			value_min = new_min
		if new_max:
			value_max = new_max
		pass

var items: Array[GDItem] = []
var wordlist

#func _get_property_list():
#	var properties = []
#	print(items.size()) # Why isn't it clearing? 
#	for itm in items:
##		properties.append(
##			{
##			"name": itm.sname,
##			"type": TYPE_BOOL,
##			"usage": PROPERTY_USAGE_DEFAULT
##			})
##		properties.append(
##			{
##			"name": itm.sname,
##			"type": TYPE_STRING,
##			"usage": PROPERTY_USAGE_DEFAULT,
##			"text": itm.sname
##			})
#		pass
#	return properties

# list_export is the exported set/get-er for list_data.
# it just gets/sets the data in list_data.
var list_data: Array[String] = []
@export var list_export: Array[String] = [] :
	get:
		return list_data
	set(value):
		list_data = value
		ui_update()

var current_selected = 0

func create_item(new_text: String = ""):
	var new_item : Label 	= Label.new()
	new_item.text 			= new_text
	new_item.horizontal_alignment 	= HORIZONTAL_ALIGNMENT_CENTER
	new_item.vertical_alignment 	= VERTICAL_ALIGNMENT_CENTER
	wordlist.add_child(new_item)
	var new_itm = GDItem.new(new_text)
	items.append(new_itm)
	pass

func _ready():
	# add audio node because i'm dumb and can't figure out how addons work with scenes.
	var audio_node = AudioStreamPlayer.new()
	audio_node.name = "audioAction"
	add_child(audio_node)
	audioAction = audio_node
	#initialize wordlist
	var lst = VBoxContainer.new()
	lst.name = "wordlist"
	add_child(lst)
	wordlist = lst
	ui_update()
	pass

func ui_update():
	if wordlist != null:
		for c in wordlist.get_children():
			c.free()
		for c in list_data:
			create_item(c)
		ui_text_selected()
	pass

# Makes the currently selected item in >item<
func ui_text_selected():
	for c in wordlist.get_children():
		var index = c.get_index()
		var word = list_data[index]
		
		if index == current_selected: 
			c.text = "> " + list_data[index]
			if not word.ends_with("!"):
				c.text += " <"
		else: 
			c.text = list_data[index]
		if word.ends_with("!"):
			c.text = c.text.erase(c.text.length()-2, 2)
			c.text += "   "
			for x in items[index].value_max:
				if x == items[index].value:
					c.text += "!"
				else:
					c.text += "-"
	pass

func play_sound(stream: AudioStream):
	if stream != null:
		print(audioAction)
		audioAction.stream = stream
		audioAction.volume_db = -8.0
		audioAction.play(0.0)
	pass

func arrow_right():
	items[current_selected].value += 1
	print(items[current_selected].value)
	play_sound(sound_effect_move)
	ui_update()
	pass

func arrow_left():
	items[current_selected].value -= 1
	play_sound(sound_effect_move)
	ui_update()
	pass

func arrow_up():
	emit_signal("moved_arrow_up")
	emit_signal("moved_arrow")
	var max_value = wordlist.get_child_count() - 1
	current_selected -= 1
	if current_selected < 0:
		current_selected = max_value
	ui_update()
	play_sound(sound_effect_move)
	pass

func arrow_down():
	emit_signal("moved_arrow_down")
	emit_signal("moved_arrow")
	var max_value = wordlist.get_child_count() - 1
	current_selected += 1
	if current_selected > max_value:
		current_selected = 0
	ui_update()
	play_sound(sound_effect_move)
	pass

func select():
	emit_signal("selected_index", current_selected)
	emit_signal("selected_text", list_data[current_selected])
	play_sound(sound_effect_pressed)
	pass

func cancel():
	emit_signal("canceled")
	pass

func _input(event):
	if takes_input:
		if Input.is_action_just_pressed("ui_up"):
			arrow_up()
		if Input.is_action_just_pressed("ui_down"):
			arrow_down()
		if Input.is_action_just_pressed("ui_left"):
			arrow_left()
		if Input.is_action_just_pressed("ui_right"):
			arrow_right()
		if Input.is_action_just_pressed("ui_accept"):
			select()
		if Input.is_action_just_pressed("ui_cancel"):
			cancel()
	pass
