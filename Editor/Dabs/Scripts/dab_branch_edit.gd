extends Dab
class_name Dab_branch_edit

# we might need tree to get the branches from it.

# we could edit it's text but that's seems unneccecary.
var trees: Array[cog_tree] = []

# hide and show nodes
@onready var nTree:   OptionButton 	= %Tree
@onready var nBranch: OptionButton 	= %Branch
@onready var nHideun: OptionButton  = %HideUnhide

# add/remove cond nodes
@onready var add_cond		: Button		= %add_cond
@onready var cond_selector	: OptionButton 	= %cond_selector
@onready var hide_cond_list	: Button 		= %hide_cond_list
@onready var cond_list		: ItemList 		= %cond_list

# containers
@onready var condContainer 		= %CondContainer
@onready var effectorContainer 	= %EffectorContainner

var text = ""

func _ready():
	super()
	add_to_group(Data.cogtypes.branchedit)
	pass

func get_visiblility():
	var vis_id 		= nHideun.get_selected_id() 
	var vis_text 	= nHideun.get_item_text(vis_id)
	var vis_index 	= nHideun.get_item_index(vis_id)
	var result 		= null # null means nothing happends. 
	match vis_index:
		1: 
			result = true # true means show
		2: 
			result = false # false means hide
	return result

func get_conditions():
	var conds = []
	return conds

func get_branch():
	# write later.
	pass

func get_cog():
	var data := cog_branch_edit.new()
	data.visible = get_visiblility()
	data.branch = get_branch()
	return data

func trees_updated():
	pass

func _on_visibility_effectors_toggled(button_pressed):
	effectorContainer.visible = button_pressed
	pass

func _on_visibility_conditions_toggled(button_pressed):
	condContainer.visible = button_pressed
	pass
