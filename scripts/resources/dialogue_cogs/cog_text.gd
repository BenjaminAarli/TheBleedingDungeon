extends cog_base
class_name cog_text

var text 	= ""
var speaker = ""

# Cogs turn to return their data.
func turn():
	return text

# for text, reading is another option. 
func read():
	return text

func _init(_text: String = ""):
	if _text != "":
		text = _text
	pass
