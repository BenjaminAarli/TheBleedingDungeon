extends cog_check

var value_to_beat
var check

func roll_2d6():
	randomize()
	var d1 = randi_range(0.5, 6.5)
	var d2 = randi_range(0.5, 6.5)
	return [d1, d2]

func read():
	var text = ""
	var diceroll = roll_2d6()
	
	text += str(diceroll) + " + "
	
	pass
	
