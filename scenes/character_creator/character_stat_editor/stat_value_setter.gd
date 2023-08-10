extends Control
class_name stat_value_setter

signal plussed_value
signal minused_value
signal value_changed

@onready var ui_stat_value   = get_node("stat_value") as RichTextLabel
@onready var ui_stat_name    = get_node("stat_name")  as Label
@onready var btn_plus_stat   = get_node("btn_plus")   as Button
@onready var btn_minus_stat  = get_node("btn_minus")  as Button

var value 		= 0
var stat_name 	= "Strenght"

var points_left = 0

var min_value 	= 0
var max_value 	= 12

func _ready():
	btn_plus_stat.pressed.connect(add_value)
	btn_minus_stat.pressed.connect(remove_value)
	add_to_group("skill_setter")
	pass 

func update_ui():
	ui_stat_value.text 	= "[center]" + str(value) + "[/center]"
	ui_stat_name.text 	= str(stat_name)
	value_changed.emit()
	pass

func set_value(new_value):
	await ready
	value = new_value
	update_ui()
	pass

func set_statname(statname):
	await ready
	stat_name = str(statname)
	update_ui()
	pass

func add_value():
	value_changed.emit()
	if value < max_value and points_left > 0:
		value += 1
		plussed_value.emit()
		print(points_left)
	update_ui()
	pass

func remove_value():
	value_changed.emit()
	if value > min_value:
		value -= 1
		minused_value.emit()
		print(points_left)
	update_ui()
	pass
