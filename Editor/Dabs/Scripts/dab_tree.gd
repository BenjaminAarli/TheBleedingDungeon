extends Dab
class_name Dab_Tree

signal tree_updated(data)

var text = ""

func _ready():
	super()
	add_to_group(Data.cogtypes.tree)
	pass

func set_data(cog: cog_tree):
	await ready
	set_text(cog.text)
	pass

func get_cog():
	var cog := cog_tree.new()
	cog.text = text
	return cog

func set_text(newtext: String):
	text = newtext
	pass

# signals

func _on_line_edit_text_changed(new_text):
	text = new_text
	tree_updated.emit(self)
	pass
