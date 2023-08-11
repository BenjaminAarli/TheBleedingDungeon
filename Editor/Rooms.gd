extends Control
class_name EDRooms

const path = "res://data/rooms/" # here if I want to add files instead of whatever... list stuff, i guess.

# Nodes
@onready var node_rooms = %NDRoom

# Add/Remove Rooms
@onready var newRoomName	: LineEdit 	= %NewRoomName
@onready var btnAddRoom		: Button	= %btnAddRoom
@onready var btnRemoveRoom	: Button	= %btnRemoveRoom

# move rooms on list
@onready var btnMoveRoomUp 		= %btnMoveUpRoom
@onready var btnMoveRoomDown 	= %btnMoveDownRoom

# Data
var rooms_data: Array[GDRoom] = []
var rooms_selected = []

# Other stuff

func add_catagory(cname: String):
	pass

func add_room(rname: String = ""):
	if not rname: rname = newRoomName.text
	print(rname)
	if rname:
		var newroom = GDRoom.new(rname)
		node_rooms.add_item(rname)
		node_rooms.set_item_metadata(node_rooms.item_count, newroom)
	# cleanup
	newRoomName.text = ""
	pass

func remove_room_selected():
	var srooms = node_rooms.get_selected_items()
	for room in srooms:
		node_rooms.remove_item(room)
	pass

func move_rooms_up():
	var srooms: Array = node_rooms.get_selected_items()
	srooms.sort()
	for room in srooms:
		node_rooms.move_item(room, room - 1)
	pass

func move_rooms_down():
	var srooms: Array = node_rooms.get_selected_items()
	srooms.sort()
	srooms.reverse()
	for room in srooms:
		node_rooms.move_item(room, room + 1)
	pass

func list_selected(new_selected):
	rooms_selected = new_selected
	print(rooms_selected)
	pass

func _ready():
	btnAddRoom.button_down.connect(add_room)
	btnRemoveRoom.button_down.connect(remove_room_selected.bind())
	btnMoveRoomDown.button_down.connect(move_rooms_down)
	btnMoveRoomUp.button_down.connect(move_rooms_up)
	# VVV might be overkill but who cares.  VVV
	node_rooms.item_selected.connect(list_selected)
	node_rooms.multi_selected.connect(list_selected)
	# 
	add_room("1 Penisfort")
	add_room("2 Bouncy Castle")
	add_room("3 Fortress of doom")
	add_room("4 Piece of shit")
	add_room("5 Self made man")
	add_room("6 GHost fever dick sucking")
	add_room("7 Nobody cares anymore")
	pass
