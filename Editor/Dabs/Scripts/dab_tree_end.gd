extends Dab
class_name Dab_Tree_End

var text 	= ""

func _ready():
	add_to_group(Data.cogtypes.treeend)
	pass

func set_data(cog: cog_tree_end):
	await ready
	set_text(cog.text)
	pass

func get_cog():
	var cog: cog_tree_end = cog_tree_end.new()
	cog.text = text
	return cog

func set_text(newtext: String):
	text = newtext
	pass
