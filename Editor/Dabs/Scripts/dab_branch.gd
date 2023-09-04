@tool
extends Dab
class_name Dab_branch

var text		: String 				= ""
var conditions	: Array[GDCondition] 	= []
var effectors	: Array[GDEffector] 	= []
var is_hidden	: bool 					= false

func _ready():
	super()
	add_to_group(Data.cogtypes.branch)
	pass

func set_data(cog: cog_branch):
	await ready
	text 		= cog.text
	is_hidden 	= cog.hidden
	conditions 	= cog.conditions
	effectors 	= cog.effectors
	pass

func get_cog():
	var cog := cog_branch.new()
	cog.text 		= text
	cog.hidden 		= is_hidden
	cog.conditions 	= conditions
	cog.effectors   = effectors
	return cog

func _on_die_pressed():
	queue_free()
	pass
