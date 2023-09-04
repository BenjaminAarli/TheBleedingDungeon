extends Control
class_name Dabs

signal updated

@onready var ui 		= %ui
@onready var scrollbar 	= %ScrollBar
@onready var list 		= %list

var held_dab: Dab = null
var over_dab: Dab = null
var something_over = false

const DAB_Base 			= preload("res://Editor/Dabs/Notes/dab_draggable.tscn")
const DAB_Text 			= preload("res://Editor/Dabs/Notes/dab_text.tscn")
const DAB_Tree 			= preload("res://Editor/Dabs/Notes/dab_tree.tscn")
const DAB_Tree_end 		= preload("res://Editor/Dabs/Notes/dab_tree_end.tscn")
const DAB_Branch 		= preload("res://Editor/Dabs/Notes/dab_branch.tscn")
const DAB_Branch_edit 	= preload("res://Editor/Dabs/Notes/dab_branch_edit.tscn")

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
	return dab

func add_cog(cog: cog_base):
	match cog:
		cog_text:
			add(DAB_Text)
		cog_tree:
			add(DAB_Tree)
		cog_tree_end:
			add(DAB_Tree_end)
		cog_branch:
			add(DAB_Branch)
		_:
			add(DAB_Base)
	pass

func add(dab: PackedScene):
	add_dab(dab.instantiate())
	pass

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
	for dab in list.get_children():
		dab.queue_free()
	pass

func set_chain(chain: GDChain):
	for cog in chain.cogs:
		add_cog(cog)
	pass

func get_dabs():
	return list.get_children() if list.get_child_count() > 0 else []

func get_cogs():
	var cogs = []
	for cog in get_dabs():
		if cog.has_method("get_cog"):
			cogs.append(cog.get_cog())
		else:
			print(cog, " does not have function get_cog so no cog was given.")
	return cogs

func _physics_process(delta):
	if held_dab and over_dab:
		check_dab_over(over_dab, held_dab)


