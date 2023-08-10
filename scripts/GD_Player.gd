extends Node
class_name GDPlayer

## Health
var health 		= 10
var health_max 	= 10

# Status Effects
var conditions 	= []

# Player Stats
var stats 		= []

# Currency
var money 		= 0

# Classes
class GDStat:
	var sname: String 	= ""
	var value: int		= 0
	func _init(new_name, new_value):
		sname = new_name
		value = new_value
		pass

# Stats #

func add_stat(statname, value: int):
	var new_stat: GDStat = GDStat.new(statname, value)
	stats.append(new_stat)
	pass

func edit_stat(statname, value: int):
	get_stat(statname).value += value
	pass

func get_stat(statname: String):
	var stat: GDStat = stats[stats.find(statname)]
	return stat

func get_stat_index(statname: String):
	var stat: int = stats.find(statname)
	return stat

# Condition #

func add_condition(cond):
	conditions.append(cond)
	pass

func has_condition(cond):
	return conditions.has(cond)

func check_conditions(cond: Array):
	var result = true # Set to false incase of 
	for c in cond:
		if not conditions.has(c):
			result = false
			break
	return result
