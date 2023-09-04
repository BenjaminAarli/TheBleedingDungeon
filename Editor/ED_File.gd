extends EditorSectorScript

# Nodes
@onready var node_start_chain: OptionButton = %startChain

func set_optionbutton_options(chains):
	node_start_chain.clear()
	for index in len(chains.get_items()): 
		var chain = chains.get_items()[index]
		node_start_chain.add_item(chain.name)
		node_start_chain.set_item_metadata(index, chain)
	pass

func get_start():
	return node_start_chain.get_selected_metadata()

func _on_file_updated():
	print("why is this not working.")
	set_optionbutton_options(file.get_chains())
	pass
