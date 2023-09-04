extends EditorSectorScript

# Nodes
@onready var lst_rooms = %lst_rooms

func set_rooms(rooms):
	lst_rooms.clear()
	for room in rooms:
		lst_rooms.add_item(room)
	pass

func get_rooms():
	# zzz # 
	pass

func _on_chains_section_updated(data: GDChains):
	set_rooms(data.get_item_names())
	pass
