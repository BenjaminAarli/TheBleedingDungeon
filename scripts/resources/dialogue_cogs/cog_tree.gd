extends cog_base
class_name cog_tree

var branches 	= []
var end = 0

func add_branch(branch):
	branches.append(branch)
	pass

# Cogs read to return data.
func read(player: GDPlayer):
	var options = "\n\n"
	for branch in branches: 
		branch = branch as cog_branch
		
		var option 	= "[url=<~index~>]" + branch.text + "[/url]" as String
		option 		= "[color=~color~]" + option + "[/color]"
		var branch_color = branch.color_unselectable 
		
		if conditions_met(branch.conditions, player):
			option = option.replace("<~index~>", str(branch.index))
			branch_color = branch.color_normal
		
		if branch.been_selected:
			branch_color = branch.color_selected
		
		option = option.replace("~color~", branch_color)
		
		if not branch.hidden:
			options += option + "\n\n"
		else:
			option += "HIDDEN: " + option + "\n\n"
	return options

func conditions_met(conditions, player: GDPlayer):
	return player.check_conditions(conditions)

func get_branch(name: String):
	var ret = null
	for branch in branches:
		if name == branch.text:
			ret = branch
			break
	return ret

func get_branches():
	return branches

func set_branch_meta(branch, _meta, value):
	var brch = get_branch(branch)
	brch.set_hidden(value) 
	pass
