extends Resource
class_name character_base

@export var display_name 	= "Rando McRandom"
@export var player_name 	= "Farty Fartington"

@export var class_ : character_class = null 

@export var health 			= 5
@export var health_max 		= 5

var stat_buy_points = 0

@export var stats := {
	"Strenght": 	{"value": 3, "description": "Physical Offence."},
	"Constitution": {"value": 3, "description": "Physical Defence. Good for taking the world."},
	"Wisdom": 		{"value": 3, "description": "Mental Offence. Good for book readers."},
	"Horror": 		{"value": 3, "description": "Mental Defence. Good for survival."},
}

@export var inventory = {}

func add_class(new_class: character_class):
	pass

func add_stat(statname, value, description):
	var new_stat = stat.new()
	new_stat.build(value, description)
	stats[statname] = new_stat
	pass

class stat:
	var id 			= -1
	var value 		= 3 
	var description = ""
	func build(set_value, set_description):
		value 		= set_value
		description = set_description
	pass
