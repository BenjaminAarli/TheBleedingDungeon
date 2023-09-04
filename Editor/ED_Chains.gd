extends EditorSectorScript

@onready var list : LSTChain = %LSTChain
@onready var node_dialog = %DabEditor

func chain_activate(index: int):
	var chain = list.get_item_metadata(index)
	node_dialog.load_chain(chain)
	pass

# when loading a file globally. 
# Set the GDChains
func set_chains(chains: GDChains):
	list.clear()
	for index in chains.get_items():
		var chain = chains.get_items()[index]
		list.add_item(chain.text)
		list.set_item_metadata(index, chain)
	pass

func _on_lst_chain_item_activated(index):
	chain_activate(index)
	pass
