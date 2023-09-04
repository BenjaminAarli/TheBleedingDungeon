extends Node2D

func write():
	print("penis hahs")

func generate_example_file():
	# This is an example file of how and when things are created. 
	# This makes it easier to identify problems when creating the editor.
	print("generating example file for testing...")
	
	var file = GDScripture.new()
	
	# set player
	var player = GDPlayer.new()
	player.add_stat("Reason", 4) # id 0 
	player.add_stat("Wisdom", 4) # id 1
	player.add_stat("Mekant", 4) # id 2
	player.add_stat("Faithe", 4) # id 3
	player.add_stat("Horror", 4) # id 4
	
	# Adds player to scripture <--
	file.add_player(player) 
	
	# Add NPCs
	var _npc_amanda = GDNPC.new("Amanda", "Gabell", 
	"Sweetpea", "A young Orcish woman with dark hair and a warm smile.", 
	GDNPC.genders.FEMALE, GDNPC.races.ORC, GDNPC.statuses.ALIVE, GDNPC.ranks.COMMONEER)
	
	var _npc_simond = GDNPC.new("Simond", "Terrier", 
	"Simond", "A thinner, well-dressed Elvish man with a stern look on his face.", 
	GDNPC.genders.MALE, GDNPC.races.ELF, GDNPC.statuses.ALIVE, GDNPC.ranks.NOBLE)
	
	var _npc_charlie = GDNPC.new("Charles", "Burrtram", 
	"Charlie", "A rough but clean Dwarf that holds his symbols of faith.", 
	GDNPC.genders.MALE, GDNPC.races.DWARF, GDNPC.statuses.ALIVE, GDNPC.ranks.CLERGY)
	
	var _npc_door_00 = GDNPC.new("Door_00", "", 
	"Old Beaten door", "A beaten up, old door.", 
	GDNPC.genders.NONE, GDNPC.races.OBJECT, GDNPC.statuses.IDLE, GDNPC.ranks.SLAVE)
	
	var _npc_door_01 = GDNPC.new("Door_01", "", 
	"Wooden Door", "A wooden door with metal beams attach to it, mockingly.", 
	GDNPC.genders.NONE, GDNPC.races.OBJECT, GDNPC.statuses.IDLE, GDNPC.ranks.SLAVE)
	
	var _npc_pockets = GDNPC.new("Pockets", "",
	"Pockets", "A feeble, hairless worm with a nervous smile.", 
	GDNPC.genders.MALE, GDNPC.races.RAT, GDNPC.statuses.ALIVE, GDNPC.ranks.SLAVE)
	
	# Add Chains
	var chn_awake 	= GDChain.new("chn_awake")
	
	# Add Rooms
	var room_intro 	= GDRoom.new("intro_room", "penis", chn_awake)
	
	file.set_start(room_intro)
	
	# Attach rooms to rooms for moving around.
#	room_forest.attach_room(room_dungeon_enterence, false)
	
	# Add Characters to rooms
	room_intro.add_character(_npc_pockets)
	
	# Add Cogs to Chains.
	chn_awake.add(cog_text.new("You are cold."))
	chn_awake.add(cog_text.new("Your body shivers as the small, dirty cloth around you scrapes against the stone floor."))
	chn_awake.add(cog_text.new("You open your eyes to see a small room. It's hard to see in the dark but the room has walls of stone and moss. Insects hiding in corners and a damp, cold floor."))
	chn_awake.add(cog_text.new("You are not alone as there is a small, furry creature in the corner. It's asleep or dead."))
	chn_awake.add(cog_text.new("oaiwdwij"))
	
	return file
