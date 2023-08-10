extends Resource
class_name GDCondition

static var conditions: Array[GDCondition] = []

signal on_equip()
signal on_unequip()

var text 		= ""
var description = ""

func _init(_text, _desc):
	text 		= _text
	description = _desc
	conditions.append(self)
	pass

