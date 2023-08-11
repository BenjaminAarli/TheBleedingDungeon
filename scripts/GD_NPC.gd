extends Resource
class_name GDNPC

enum statuses 	{ALIVE, DEAD, AGGRESIVE}
enum races 		{HUMAN, RAT, ORC, ELF, DWARF, OGRE}
enum rank 		{SLAVE, PEASANT, COMMONEER, NOBLE, CLERGY}

var fname = "penis"
var lname = "PorkFace"
var nname = "The Slurper"

var state	: statuses 	= statuses.ALIVE
var race	: races 	= races.HUMAN

var is_dead  	= false
var is_known 	= false
var is_missing 	= false

var speak_with_dead_chain: GDChain

func get_status():
	if is_dead:
		return statuses.DEAD
	else:
		return state

func set_dead(boolean: bool):
	is_dead = boolean
	pass

func die():
	is_dead = true
	pass

func ressurect():
	is_dead = false
	pass
