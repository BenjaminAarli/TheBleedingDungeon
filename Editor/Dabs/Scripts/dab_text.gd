extends Dab
class_name Dab_Text

var text 	= ""
var speaker = ""

@onready var node_text			: TextEdit 		= %textbox
@onready var node_speaker		: LineEdit 		= %speaker
@onready var node_has_speaker	: CheckButton 	= %has_speaker

func _ready():
	super()
	add_to_group(Data.cogtypes.text)
	set_has_speaker(false)
	pass

func set_data(cog: cog_text):
	await ready
	set_text(cog.text)
	set_speaker(cog.speaker)
	if cog.speaker != "":
		set_has_speaker(true)
	pass

func get_cog():
	var cog := cog_text.new()
	cog.text 	= text
	cog.speaker = speaker
	return cog

# Setters

func set_text(new_text: String):
	node_text.text = new_text
	text = new_text
	pass

func set_speaker(new_text: String):
	node_speaker.text = new_text
	speaker = new_text
	pass

func set_has_speaker(value: bool):
	if value: 	node_speaker.show()
	else: 		node_speaker.hide()

# Connections

func _on_textbox_text_changed():
	text = node_text.text
	pass

func _on_speaker_text_changed(new_text):
	speaker = new_text
	pass

func _on_has_speaker_toggled(button_pressed):
	set_has_speaker(button_pressed)
