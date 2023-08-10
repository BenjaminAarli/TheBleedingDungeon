extends Control
class_name Dab

signal on_grabbed
signal on_released
signal on_dragover
signal on_dragleave
signal on_death

signal is_moving
signal is_idle

var is_living			: bool = true
var is_grabbed			: bool = false
var is_mouse_inside		: bool = false
static var is_grabbable	: bool = true

var dab_position		: int	= 0
var dab_position_extra	: int	= 0
var grab_position 		: Vector2 = Vector2.ZERO

var mouse_was_inside : bool = false

@onready var btn_delete 		= %Delete
@onready var deleteProgressBar 	= %DeleteProgress
var delete_timer_time 		= 0.5
var delete_timer_time_max 	= 0.5

func _ready():
	add_to_group(Data.cogtypes.none)
	
	mouse_entered.connect(
		func(): 
			is_mouse_inside = true
			modulate.g = 255
			)
	mouse_exited.connect(
		func(): 
			is_mouse_inside = false
			modulate.g = 0
			)
	
	btn_delete.button_up.connect(delete_btn_up.bind())
	btn_delete.button_down.connect(delete_btn_down.bind())
	deleteProgressBar.max_value = delete_timer_time
	deleteProgressBar.value = 0
	pass

var deleting_self = false

func delete_btn_down():
	deleting_self = true
	pass

func delete_btn_up():
	deleting_self = false
	deleteProgressBar.value = 0
	pass

func check_mouse_over():
	return is_mouse_inside

func can_be_grabbed():
	return is_grabbable

func check_is_grabbed():
	return is_grabbed

func check_mouse_pressed():
	return Input.is_mouse_button_pressed(1)

func check_other_grabbed():
	return !is_grabbable

func check_if_idle():
	var result = false
	if position.y - (dab_position + dab_position_extra) == 0:
		result = true
	return result

func check():
	var mouse_over 	= check_mouse_over()
	var mouse_click = check_mouse_pressed()
	var mouse_grab 	= check_is_grabbed()
	var other_grab 	= check_other_grabbed()
	
	if is_living:
		# Grab
		if is_grabbable and check_mouse_over() and check_mouse_pressed():
			z_index = 1
			is_grabbed = true
			on_grabbed.emit()
			is_grabbable = false
		# Release
		elif check_is_grabbed() and !check_mouse_pressed():
			z_index = 0
			is_grabbed = false
			on_released.emit()
			is_grabbable = true
		# Drag over
		elif check_mouse_over() and check_mouse_pressed() and !is_grabbable:
			mouse_was_inside = true
			on_dragover.emit()
		# Drag Away
		elif mouse_was_inside and check_mouse_pressed() and !is_grabbable:
			mouse_was_inside = false
			on_dragleave.emit()
		pass

func check_delete_progress(delta):
	if deleting_self:
		delete_timer_time -= delta
	if not deleting_self:
		delete_timer_time = delete_timer_time_max
	if delete_timer_time != delete_timer_time_max:
		var time = 0 + -(delete_timer_time - delete_timer_time_max)
		deleteProgressBar.value = time
	if delete_timer_time <= 0:
		queue_free()
		on_death.emit()
	pass

func _physics_process(delta):
	check()
	check_delete_progress(delta)
	if is_grabbed and has_parent():
		position.y = get_parent().get_local_mouse_position().y - (size.y / 2)
	elif !check_if_idle():
		if absf(position.y - (dab_position + dab_position_extra)) < 8:
			position.y = (dab_position + dab_position_extra)
			is_living = true
			is_idle.emit()
		else:
			position.y = lerpf(position.y, dab_position + dab_position_extra, delta * 12)
			is_living = false
			is_moving.emit()
	pass

func has_parent():
	return true if not get_parent() is Window else false
