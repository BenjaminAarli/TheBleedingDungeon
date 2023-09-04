extends GDFlesh
class_name GDNPC

enum statuses 	{ALIVE, DEAD, AGGRESIVE, IDLE}
enum races 		{HUMAN, RAT, ORC, ELF, DWARF, OGRE, OBJECT}
enum ranks 		{SLAVE, PEASANT, COMMONEER, NOBLE, CLERGY}
enum genders 	{MALE, FEMALE, NONE, OTHER}

var fname = "Penis"			# first name
var lname = "Porker"		# last name
var nname = "The Slurper" 	# nickname
var description = "They have a massive penis."

var status	: statuses 	= statuses.ALIVE
var race	: races 	= races.HUMAN
var rank 	: ranks 	= ranks.COMMONEER
var gender 	: genders 	= genders.NONE

var is_known 	= false
var is_missing 	= false

var speak_with_dead_chain: GDChain

func get_status():
	if is_dead:
		return statuses.DEAD
	else:
		return status

func set_dead(boolean: bool):
	is_dead = boolean
	pass

func die():
	is_dead = true
	pass

func ressurect():
	is_dead = false
	pass

func _init(firstname: String, lastname: String, nickname: String, 
	ini_desc: String, ini_gender: genders, ini_race: races, 
	ini_status: statuses, ini_rank: ranks):
	
	fname = firstname
	lname = lastname
	nname = nickname
	description = ini_desc
	gender 		= ini_gender
	race 		= ini_race
	rank 		= ini_rank
	status 		= ini_status
	pass
