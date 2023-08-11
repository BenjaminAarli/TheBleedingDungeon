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
	var ptext: String = text
	var checks = ["-greet", "-bye", "-thanks"]
	for check in checks:
		var index	: int 		= check.get_index()
		var section	: Array 	= phrase.values()[check.get_index()]
		var word	: String 	= section[randi_range(0, section.size() - 1)]
		ptext.replace(check, word)
		pass
	return ptext
