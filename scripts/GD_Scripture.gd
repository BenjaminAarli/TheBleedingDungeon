extends Resource
class_name GDScripture

# Scriptures are the containers for game data. It's what the game engine uses. 

signal updated

@export var chains: Array[GDChain] = []
@export var starting_chain: GDChain

var players: Array[Player] = []

# Players

func get_player(index: int = 0):
	return players[index]

func get_players():
	return players

## Story functions

func set_starting_chain(chain: GDChain):
	starting_chain = chain
	updated.emit()
	pass

func get_starting_chain():
	if not starting_chain:
		print("Could not find starting chain in GDScripture, instead using first one I find.")
		return chains.front()
	else:
		return starting_chain

func add_chain(sname: String):
	var new_chain = GDChain.new(sname)
	chains.append(new_chain)
	updated.emit()
	return sname

func remove_chain(sname: String):
	var result = chains.find(sname)
	chains.remove_at(result)
	updated.emit()
	return result

func get_chain_using_text(sname: String):
	return chains[chains.find(sname)]

func get_chain_using_index(index: int):
	return chains[index]

func get_chain_index_using_text(sname: String):
	return chains.find(sname)

func get_chains():
	return chains
