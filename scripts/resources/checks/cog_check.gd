class_name cog_check
extends Node

var success_position = -1
var failure_position = -1

var stat = ""

func read():
	pass

func has_success():
	pass

func has_failure():
	pass

# check 
func check_condition(cond):
	return Player.has_condition(cond)

func check_stat(stat, value):
	return Player.get_stat(stat) >= value

