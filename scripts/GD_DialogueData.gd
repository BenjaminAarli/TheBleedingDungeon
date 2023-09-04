extends Node

const phrase = {
	"-greet": 
	[
		"Hello",
		"Morning", 
		"Evening", 
		"Welcome", 
		"Hail, hail!"
	],
	"-bye": 
	[
		"Bye",
		"Goodbye",
		"Adiue",
		"See you later",
		"Gods be with you",
	],
	"-thanks": 
	[
		"Thank you",
		"Thanks",
	], 
	"-spell_swd":
	[
		"...Aaaargh. Why am I heeere?... Oh, the cold...."
	]
}

func parse(text: String):
	randomize()
	var ptext: String = text
	var checks = ["-greet", "-bye", "-thanks"]
	var index: int = 0
	for check in checks:
		var section	: Array 	= phrase.values()[index]
		var word	: String 	= section[randi_range(0, section.size() - 1)]
		ptext = ptext.replace(check, word)
		index += 1
	return ptext

var commands = [
	["read ...", "examine ...", "look at ...", "check out ..."], 		# check description
	["look around", "check room", "look around room"], 	# check room desc, people, exits and look for items.
	["open ..."], 			# access closed object
	["use ... on ..."], # use item or object
	["take ...", "grab ..."], 	# take item
]

# example strings   

func check_for_command(t: String):
	var _text: String = t
	var checks = commands
	for check in checks:
		pass
	pass
# zzz
