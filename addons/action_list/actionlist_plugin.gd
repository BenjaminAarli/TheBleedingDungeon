@tool
extends EditorPlugin

const NODE_NAME 	= "ActionList"
const INHERITANCE 	= "VBoxContainer"
const THE_SCRIPT 	= preload("res://addons/action_list/ActionList.gd")
const THE_ICON 		= preload("res://addons/action_list/icon/ActionList.png")

func _enter_tree():
	add_custom_type(NODE_NAME, "VBoxContainer", THE_SCRIPT, THE_ICON)
	pass

func _exit_tree():
	remove_custom_type(NODE_NAME)
	pass
