extends Node2D

var gamescene = "res://scenes/Game.tscn"
const SAVE_FILE_PATH = "res://data/Game Files/"

var file: GDScripture

var current_story 	= ""

#var lang = "en"
#
#func _ready():
#	example()
#	pass
#
## a working example of how the file is generated piece-by-piece.
#func example():
#	file = GDScripture.new()
#	var player	: GDPlayer 	= GDPlayer.new()
#
#	player.add_stat("Reason" , 3)
#	player.add_stat("Wisdom" , 3)
#	player.add_stat("Horror" , 3)
#	player.add_stat("Faith"  , 3)
#	player.add_stat("Machine", 3)
#
#	set_starting_story("elevator")
#	set_story("elevator")
#
#	addtext("You awaken to the sound of a passing vehicle splashing water onto you. It's engine is loud as it's words sound like knives to your head.")
#	addtext("You find yourself sullied in mukk; lying face-first in a literal ditch. Somehow, you've managed to find comfort where there is none.")
#	addtext("Aside from your respite, there is the issue of where we are right now. You don't recognize the street, let alone the fact that we are sleeping in the street in the first place.")
#
#	addtext("You look around and see noone around. It's dark out and only the street lamp lights are keeping you company. Most; if not all of the windows nearby are shut and you see no light in them.")
#	addtext("This isn't strange. Most people like to sleep at night; you however are here in this... puddle?")
#	addtext("You look down. You are lying in a puddle of various colors and smells. It's not all dirt and mud.")
#
#	# Examine the puddle.
#	addtree()
#	addbranch("Examine the puddle")
#	addtext("You look into the puddle beneath you. You are lying in what looks to be mud, pieces of potato and some green-brown mixture.")
#	addtext("It's cold and flakey; and you are covered in it.")
#	addbranch("Examine the puddle hardcore!")
#	addtext("You look deep into the puddle beneath you. It's colors are strange and mysterious; filled with hits of potatos and some green-brown liquid.")
#	addtext("You poke around in it; removing some of the flakey bits ontop of it. It's smell is horrid and it gets worse the more you dig.")
#	addtext("The only thing keeping you from vomiting is the lack of food in your stomach.")
#
#	# Eat the vomit
#	addtext("Hey. You.")
#	addtree()
#	addbranch("Who... me?")
#	addtext("Yes, you! You should taste it.")
#	showbranch("No! that's insane! [don't continue]")
#	showbranch("taste it?")
#
#	addbranch("taste it?", true)
#	addtext("Yeeeeh, gotta know what it tastes like, right?!")
#
#	showbranch("Why would I do that?")
#	showbranch("That sounds unsafe.")
#	showbranch("Who are you?")
#	showbranch("Taste the cold, crusty and pungant liquid")
#
#	addbranch("Why would I do that?", true)
#	addtext("Look at it scientifically. We don't know what it tastes like and for some reason, that's important for you.")
#
#	addbranch("That sounds unsafe.", true)
#	addtext("Every second you spend thinking about it; it becomes unsafer. This is a ticking time bomb and you are wasting precious seconds contemplating your actions")
#	addtext("Additionally, whatever doesn't kill you - makes you stronger; and this sure as hell won't kill you.")
#
#	addbranch("Who are you?", true)
#	addtext('What do you mean "who are you?". Do you ask the wind who it is? Do you ask math when number combine into each other who they are? No.')
#	addtext("I am your deep and strange contemplation on an act you deem vile but neccecary. I didn't know I was here but here I am and now knowing that; the real question returns... ?")
#
#	addbranch("Taste the cold, crusty and pungant liquid", true)
#	addtext("You bow your head in defeat, and scrape ")
#
#	addbranch("No! that's insane! [don't continue]", true)
#	addtext("Yeah, no. no. You are right, that's crazy. We would learn nothing from that.")
#
#	endtree()
#
#	addbranch("I've seen enough... [don't examine]")
#	addtext("Yeh, it's probably just mud and... who cares. Let's go.")
#	endtree()
#
#	addtext("You stand up. - the end.")
#	# end of file
#
#	prepare_game_file()
#	pass
#
#func new_file():
#	file = GDScripture.new()
#
#	current_story = ""
#	pass
#
## --- # --- # --- # --- # --- # --- # --- #
#
#func prepare_game_file():
#	Filehandler.save_file(file)
#	Data.editor_file_data = file 
#	pass
#
## --- # --- # --- # --- # --- # --- # --- #
#
#func get_file_size():
#	return file.chains[current_story].size()
#
## --- # --- # --- # --- # --- # --- # --- #
#
#func set_story(text: String):
#	current_story = text
#	pass
#
#func set_starting_story(text: String):
#	file.set_starting_story(text)
#	pass
#
## --- # --- # --- # --- # --- # --- # --- #
#
#func add(story: String, data: cog_base):
#	if not file.chains.has(story):
#		file.chains[story] = []
#
##	data.line_position 	= get_file_size()
#
#	# Add to chains in file.
#	file.chains[story].append(data)
#	pass
#
## --- # --- # --- # --- # --- # --- # --- #
#
#func addtext(text, speaker = ""):
#	var cog = cog_text.new()
#	cog.text 	= text
#	cog.speaker = speaker
#	# add to file under story.
#	add(current_story, cog)
#	pass
#
#func addtree(text = ""):
#	var cog = cog_tree.new()
#	cog.text = text
#	# add to file under story.
#	add(current_story, cog)
#	pass
#
#func addbranch(text, hidden = false, conds = []):
#	var index 				= get_file_size() + 1
#	var new_branch  		= cog_branch.new()
#
#	new_branch.text 		= text
#	new_branch.conditions 	= conds
#	new_branch.index 		= index 
#	new_branch.hidden 		= hidden
#
#	new_branch.return_to_tree 	= true
##	new_branch.skip_to 			= current_tree.back()
#
##	get_dialog_tree().add_branch(new_branch)
#
#	# add to file under story.
#	add(current_story, new_branch)
#	pass
#
#func endtree():
#	var cog = cog_tree_end.new()
#
##	get_dialog_tree().end = get_file_size()
##
##	current_branch.pop_back()
##	current_tree.pop_back()
#	# add to file under story.
#	add(current_story, cog)
#	pass
#
#func editbranch(tree, branch, meta, value):
#	var cog = cog_tree_edit.new()
#	cog.tree 	= tree
#	cog.branch 	= branch
#	cog.meta 	= meta
#	cog.value 	= value
#	add(current_story, cog)
#	pass
#
#func hidebranch(branch):
#	var cog 	= cog_tree_edit.new()
##	cog.tree 	= get_dialog_tree()
#	cog.branch 	= branch
#	cog.meta 	= "hidden"
#	cog.value 	= true
#	add(current_story, cog)
#
#func showbranch(branch):
#	var cog 	= cog_tree_edit.new()
##	cog.tree 	= get_dialog_tree()
#	cog.branch 	= branch
#	cog.meta 	= "hidden"
#	cog.value 	= false
#	add(current_story, cog)
#
## Set player values
#
#func edit_player(edit_type: cog_event_player.ptype, amount, edit_value_type: cog_event_player.pvalue = 1):
#	var cog = cog_event_player.new()
#	cog.type 	= edit_type
#	cog.amount 	= amount
#	cog.pvalue 	= edit_value_type
#	add(current_story, cog)
#
#func set_player_stat(stat, value):
#	Player.add_stat(stat, value)
#	pass
#
#
#
#
#
