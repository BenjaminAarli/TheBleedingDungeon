extends Node

var editor_file_data = null
var editor_load_on_enter = false
var on_end_return_to_editor = false

const scene = {
	main_menu 	= "res://scenes/MainMenutscn.tscn",
	game_engine = "res://Game/Game.tscn",
	editor 		= "res://Editor/Editor.tscn"
}

const cogtypes = {
	none 		= "base", 
	text  		= "text", 
	tree 		= "tree", 
	check 		= "check",
	branch 		= "branch", 
	treeend 	= "tree_end", 
	branchedit 	= "branch_edit",
	playeredit 	= "player_edit",
}

enum lang {
	english
}
