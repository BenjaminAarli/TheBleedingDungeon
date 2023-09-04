extends Resource
class_name GDScripture

# Scriptures are the containers for game data. It's what the game engine uses. 

signal updated

# Lists of things.
var chains		:= GDChains.new()
var quests 		:= GDQuests.new()
var spells  	:= GDSpells.new()
var deities		:= GDDeities.new()
var rooms		:= GDRooms.new()
var conditions 	:= GDConditions.new()
var npcs 		:= GDNPCs.new()

var player		: GDPlayer	= null # This is kept as a player initator. 
var start		: GDRoom 	= null # This is the room that starts the file.

# For easier saving, the player(s) are kept in the game file when saving. 
var players		:= GDPlayers.new() 

# Start Chain Functions #

func set_start(room: GDRoom):
	start = room
	pass

# ADDers

func add_player(player: GDPlayer):
	players.add_item(player)
	pass

func add_chain(sname: String):
	chains.add_item(sname)
	pass

func add_quest(quest: GDQuest):
	quests.add_item(quest)
	pass

func add_room(room: GDRoom):
	rooms.add_item(room)
	pass

func add_condition(cond: GDCondition):
	conditions.add_item(cond)
	pass

func add_god(god: GDDeity):
	deities.add_item(god)
	pass

# get individual

func get_start(): 
	return start
func get_player(index: int = 0):
	return players.get_item(index)

# get all

func get_players():
	return players.get_items()

func get_chains():
	return chains.get_items()
