extends TabContainer
class_name EDSections

@onready var sec_file 	= %File
@onready var sec_player = %Player
#@onready var sec_dials 	= %Dialogue
@onready var sec_npcs 	= %NPCs
@onready var sec_rooms	= %Rooms
@onready var sec_chains = %Chains

func set_file(file: GDScripture):
	sec_file.set_file(file)
	sec_player.set_file(file)
#	sec_dials.set_file(file)
	sec_npcs.set_file(file)
	sec_rooms.set_file(file)
	sec_chains.set_file(file)
	pass

