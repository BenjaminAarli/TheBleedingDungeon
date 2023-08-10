extends Resource
class_name GDChain

var cogs: Array = []
var name: String = ""

func add(cog: cog_base):
	cogs.append(cog)
	pass

func _init(newname: String):
	name = newname
	pass
