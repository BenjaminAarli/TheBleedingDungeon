extends Resource
class_name GDRoom

var name: String = "Room_Name"
var nearby: Array[GDRoom] = []
var inside: Array[GDNPC]  = []
var description: String = "It's a small room."

var is_visable = true # is visible when looked for. 
var is_locked = false # is enterable when false or needs picklocks (or damage)

var on_enter_chain: GDChain
var chain: GDChain

func set_on_enter_chain(_chain: GDChain):
	on_enter_chain = _chain
	pass

func set_chain(_chain: GDChain):
	chain = _chain
	pass

func add_character(character: GDNPC):
	inside.append(character)
	pass

func attach_room(aroom: GDRoom, visable = true, locked = false):
	nearby.append(aroom)
	is_visable 	= visable
	is_locked 	= locked
	aroom.nearby.append(self)
	pass

func enter_room(GE: GameEngine):
	GE.current_room 	= self
	GE.current_story 	= chain
	GE.current_line 	= 0
	GE.write(description)
	pass

func _init(roomname: String, desc: String = "", _chain: GDChain = null):
	name 			= roomname
	description 	= desc
	chain 			= _chain
	pass

