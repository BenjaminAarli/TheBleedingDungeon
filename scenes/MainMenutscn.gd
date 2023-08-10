extends Control

@onready var scn_main = %Main
@onready var scn_sett = %Settings
@onready var lst_main = %MainList
@onready var lst_sett = %SettingsList

@onready var scn_editor = preload(Data.scene.editor)
@onready var scn_game	= preload(Data.scene.game_engine)

func _ready():
	scn_sett.hide()
	lst_sett.takes_input = false
	pass

func _on_main_list_selected_index(option):
	match option:
		0: # New Game
			get_tree().change_scene_to_packed(scn_game)
			pass
		1: # Load Game
			get_tree().change_scene_to_packed(scn_game)
			pass
		2: # Editor
			if scn_editor:
				get_tree().change_scene_to_packed(scn_editor)
			pass
		3: # settings
			lst_main.takes_input = false
			scn_sett.show()
			await 1
			lst_sett.takes_input = true
		4: # quit
			get_tree().quit()
			pass 
	pass

func _on_settings_list_selected_index(option):
	match option:
		0: # Return to menu
			lst_sett.takes_input = false
			scn_sett.hide()
			await get_tree().create_timer(0.1).timeout
			lst_main.takes_input = true
			pass
		1: # Volume
			pass
		2: # Exit (will change later	
			pass 
	pass
