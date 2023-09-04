extends Node2D
class_name BaseEditor

var save_path = "res://data/custom_game/"
var file_name = "gamefile.tres"

var file	: GDScripture	= GDScripture.new()
var player	: GDPlayer  	= GDPlayer.new()

# Sections
@onready var sections: EDSections = %sections

func _ready():
	# If not file is saved, use new file.
	if not set_file(load_file()):
		set_file(file)
	pass

func set_file(sfile: GDScripture):
	if sfile:
		sections.set_file(sfile)
		return true
	else:
		return false
func load_file(): return ResourceLoader.load(save_path + file_name)
func save_file(file: GDScripture): ResourceSaver.save(file, save_path + file_name, 0)

# steps to create a scripture
	# 1 - Create the File. 
	# 2 - Create the Player.
	# 3 - Add Player to File.
	# 4 - Create and Add the NPCs
	# 5 - Create and Add the Chains
	# 6 - Create and Add the Rooms
	# 7 - Set Start of Game. (Room)
	# 8 - Add Characters to Rooms
	# 9 - Create and Add Cogs to Chains.
	#10 - Play The Game using File.
func generate_file():
	# zzz # 
	pass

func _on_player_section_updated(data: GDPlayer):
	player = data
	pass

func _on_rooms_section_updated(data: GDRooms):
	pass

func _on_dialogue_section_updated(data: GDChains):
	pass
