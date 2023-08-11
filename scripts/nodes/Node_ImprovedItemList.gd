extends ItemList
class_name ImprovedItemList

signal item_added(iname: String, index: int)
signal item_removed(iname: String, index: int)
signal item_moved(iname: String, old_position: int, new_position: int)

# Add/Remove
@export var newItemName			: LineEdit
@export var btnAdd				: Button
@export var btnRemoveSelected	: Button
@export var btnMoveSelectedUp 	: Button
@export var btnMoveSelectedDown	: Button

func add_new_item(rname: String = ""):
	if not rname: rname = newItemName.text
	if rname:
		add_item(rname)
	newItemName.text = ""
	item_added.emit(rname, item_count)
	pass

func remove_item_selected():
	var srooms = get_selected_items()
	for room in srooms:
		var roomname = get_item_text(room)
		remove_item(room)
		item_removed.emit(roomname, room)
	pass

func move_item_up():
	var srooms: Array = get_selected_items()
	srooms.sort()
	for room in srooms:
		var roomname = get_item_text(room)
		move_item(room, room - 1)
		item_moved.emit(roomname, room, room - 1)
	pass

func move_item_down():
	var srooms: Array = get_selected_items()
	srooms.sort()
	srooms.reverse()
	for room in srooms:
		var roomname = get_item_text(room)
		move_item(room, room + 1)
		item_moved.emit(roomname, room, room + 1)
	pass

func get_data():
	var data: Array[GDRoom] = []
	for index in item_count:
		var room_data = get_item_metadata(index)
		data.append(room_data)
	return data

func _ready():
	btnAdd.button_down.connect(add_new_item)
	btnRemoveSelected.button_down.connect(remove_item_selected)
	btnMoveSelectedDown.button_down.connect(move_item_down)
	btnMoveSelectedUp.button_down.connect(move_item_up)
	add_new_item("1 Penisfort")
	add_new_item("2 Bouncy Castle")
	add_new_item("3 Fortress of doom")
	add_new_item("4 Piece of shit")
	add_new_item("5 Self made man")
	add_new_item("6 GHost fever dick sucking")
	add_new_item("7 Nobody cares anymore")
	pass
