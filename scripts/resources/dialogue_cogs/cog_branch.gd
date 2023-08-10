extends cog_base
class_name cog_branch

signal update_branches

# public #
var conditions: Array[GDCondition]	= [] # requirements
var effectors : Array[GDEffector]	= [] # requirements
var hidden	  : bool 				= false
var text 	  : String 				= ""

# private #
var index 			= -1
var been_selected 	= false

const color_normal 			= "#ff7700"
const color_selected 		= "#b04000"
const color_unselectable 	= "#999999"

func _ready():
	skip = true

func set_hidden(value: bool):
	hidden = value
	pass
