extends Control
class_name Dabs

signal updated

@onready var ui 		= %ui
@onready var scrollbar 	= %ScrollBar
@onready var list 		= %list

var held_dab: Dab = null
var over_dab: Dab = null
var something_over = false

func _ready():
	list 		= find_child("list")
	ui 			= find_child("ui")
	scrollbar 	= find_child("ScrollBar")
	updated.connect(dabs_updated.bind())
	pass

func dabs_updated():
	sort_dabs()
	pass

func dab_grabbed(dab: Dab):
	dab.mouse_filter = Control.MOUSE_FILTER_IGNORE
	held_dab = dab
	for dabs in get_tree().get_nodes_in_group("dab"):
		if dabs != held_dab:
			dabs.is_grabbable 	= false
	dab.is_grabbable 		= true
	held_dab.is_grabbable 	= true
	dab.grab_position = dab.position
	pass

func dab_released(dab: Dab):
	dab.mouse_filter = Control.MOUSE_FILTER_STOP
	held_dab = null
	for dabs in get_tree().get_nodes_in_group("dab"):
		dabs.is_grabbable = true
	pass

# if the held dab is over a non-held dab. Swap their positions.
func check_dab_over(dab_over: Dab, dab_held: Dab):
	var held_midpos = dab_held.position.y + (dab_held.size.y / 2)
	var held_start 	= dab_held.position.y
	var held_end	= dab_held.position.y + dab_held.size.y
	var over_midpos = dab_over.position.y + (dab_over.size.y / 2)
	
	var grabbed_above = dab_held.grab_position.y < dab_over.position.y
	
	# dab is above
	if dab_held.is_living and dab_over.is_living and grabbed_above:
		if held_end > over_midpos:
			list.move_child(dab_held, dab_over.get_index())
	elif dab_held.is_living and dab_over.is_living and !grabbed_above:
		if held_start < over_midpos:
			list.move_child(dab_held, dab_over.get_index())
	updated.emit()
	pass

func dab_dragover(dab: Dab):
	if dab != held_dab:
		over_dab = dab
	something_over = true
	updated.emit()
	pass

func dab_dragleave(dab: Dab):
	if dab != held_dab:
		over_dab = null
	something_over = false
	updated.emit()
	pass

func dab_is_moving(dab: Dab):
	pass

func dab_is_idle(dab: Dab):
	pass

func sort_dabs():
	var margin = 4
	var previous_position = -1
	if list.get_child_count() > 0:
		for dab in list.get_children():
			dab = dab as Dab
			dab.dab_position_extra = 0
			dab.dab_position = previous_position
			previous_position += dab.size.y + margin
	list.custom_minimum_size.y = previous_position
	pass

# add/remove

func check_signals(dab):
	if dab:
		dab.on_grabbed.connect(		dab_grabbed.bind(dab)	)
		dab.on_released.connect(	dab_released.bind(dab)	)
		dab.on_dragover.connect(	dab_dragover.bind(dab)	)
		dab.on_dragleave.connect(	dab_dragleave.bind(dab)	)
		dab.is_moving.connect(		dab_is_moving.bind(dab)	)
		dab.is_idle.connect(		dab_is_idle.bind(dab)	)
		dab.on_death.connect(		dabs_updated.bind()		)
	print(dab)
	return dab

func add_dab(dab):
	dab = check_signals(dab)
	list.add_child(dab)
	updated.emit()
	pass

func remove_dab(dab: Dab):
	list.remove_child(dab)
	updated.emit()
	pass

func clear():
	print("Start:\n\n")
	for dab in list.get_children():
		dab.queue_free()
	pass

func get_dabs():
	return list.get_children()

func get_cogs():
	pass

func _physics_process(delta):
	if held_dab and over_dab:
		check_dab_over(over_dab, held_dab)


