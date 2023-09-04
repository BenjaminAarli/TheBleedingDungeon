extends ItemList
class_name ImprovedItemList

signal item_added(itemname: String)
signal item_removed
signal item_moved

# Add/Remove
@export var newItemName			: LineEdit
@export var btnAdd				: Button
@export var btnRemoveSelected	: Button
@export var btnMoveSelectedUp 	: Button
@export var btnMoveSelectedDown	: Button

func on_add_item() -> int:
	emit_signal("item_added", newItemName.text)
	newItemName.text = ""
	return 0

func remove_item_selected():
	var srooms = get_selected_items()
	for room in srooms:
		var roomname = get_item_text(room)
		remove_item(room)
		emit_signal("item_removed")
	pass

func move_item_up():
	var srooms: Array = get_selected_items()
	srooms.sort()
	for room in srooms:
		var roomname = get_item_text(room)
		move_item(room, room - 1)
		item_moved.emit()
	pass

func move_item_down():
	var srooms: Array = get_selected_items()
	srooms.sort()
	srooms.reverse()
	for room in srooms:
		var roomname = get_item_text(room)
		move_item(room, room + 1)
		item_moved.emit()
	pass

func get_data():
	var data: Array[GDRoom] = []
	for index in item_count:
		var room_data = get_item_metadata(index)
		data.append(room_data)
	return data

func _ready():
	btnAdd.button_down.connect(on_add_item)
	btnRemoveSelected.button_down.connect(remove_item_selected)
	btnMoveSelectedDown.button_down.connect(move_item_down)
	btnMoveSelectedUp.button_down.connect(move_item_up)
	pass
