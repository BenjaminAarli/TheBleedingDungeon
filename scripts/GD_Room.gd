extends Resource
class_name GDRoom

var name: String = "Room_Name"
var nearby: Array[GDRoom] = []
var description: String = "It's a small room."

var on_enter_chain: GDChain
var chain: GDChain

static var rooms = []

func _init(roomname: String):
	name = roomname
	rooms.append(self)
	print("I now exist. ", name ," Fear me.")
	pass

