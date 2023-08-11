extends Node2D
class_name BaseEditor

var save_path = "res://data/custom_game/"
var file_name = "gamefile.tres"

var file			: GDScripture
var current_chain	: GDChain

# nodes
@onready var label_current_chain: Label = %curChain
@onready var lstChain	: ItemList 		= %LstChain
@onready var startChain	: OptionButton 	= %startChain

@onready var DabEditor = %DabEditor
@onready var DabCont: Dabs = %Dabs

func update_data(filedata: GDScripture):
	# starting chain setup
	var old_index = startChain.get_selected_id()
	var old_text  = startChain.get_item_text(old_index)
	startChain.clear()
	for chain in filedata.get_chains():
		startChain.add_item(chain)
	startChain.select(old_index)
	# end
	pass

func _ready():
	if not load_scripture():
		new_scripture()
		file.updated.connect(update_data.bind(file))
	pass

func update_ui():
	update_chains()

# Save/Load File

func load_scripture():
	file = Filehandler.load_file(save_path + file_name)
	file.updated.connect(update_ui.bind())
	update_ui()
	return file

func save_scripture():
	Filehandler.save_file(file, save_path + file_name)
	pass

# chain stuff

func load_chain_into_editor(index: int):
	var chain: GDChain = file.get_chain_using_index(index)
	print(chain)
	DabEditor.load_chain(chain)
	pass

# New File

func new_scripture():
	file = GDScripture.new()
	file.updated.connect(update_ui.bind())
	update_ui()
	pass

# update

func chain_selected(index: int):
	var newchain = file.get_chain_using_index(index)
	if newchain.resource_name != null or "":
		label_current_chain.text = newchain.resource_name
	load_chain_into_editor(index)
	pass

func update_chains():
	var old_selected
	var str_chain_index = startChain.selected
	var str_chain_text
	
	if lstChain.is_anything_selected():
		old_selected = lstChain.get_selected_items()[0]
	if str_chain_index:
		str_chain_text  = startChain.get_item_text(startChain.selected)
	
	lstChain.clear()
	startChain.clear()
	
	for chain in file.get_chains():
		lstChain.add_item(chain.name)
		startChain.add_item(chain.name)
	if old_selected:
		lstChain.select(old_selected)
	startChain.select(str_chain_index)
	pass

func _on_chain_selected(index: int):
	chain_selected(index)
	pass
