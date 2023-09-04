extends ImprovedItemList
class_name LSTChain

func _ready():
	super()
	item_added.connect(add_new_chain)
	add_new_chain("penis")

func add_new_chain(cname: String):
	if cname == "": return
	var index = add_item(cname)
	set_item_metadata(index, GDChain.new(cname))
	pass

