extends cog_base
class_name cog_branch_edit

var branch	: cog_branch

# stats
var visible: bool

func turn():
	if visible != null:
		branch.set_hidden(visible)
	pass

func _ready():
	skip = true

