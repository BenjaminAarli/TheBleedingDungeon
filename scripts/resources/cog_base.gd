extends Resource
class_name cog_base

# what is this cog inside of.
var inside_tree 	= []
var inside_branch 	= []
var inside_check 	= []

var skip_to 		= null
var skip 			= false
var seen_before 	= false

func get_player(player: GDPlayer):
	return player

func get_scripture(scripture: GDScripture):
	return scripture



func get_last_tree():
	return inside_tree.back()

func get_last_branch():
	return inside_branch.back()

func get_last_check():
	return inside_check.back()
