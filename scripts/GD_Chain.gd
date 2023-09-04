extends Resource
class_name GDChain

const type = "GDChain"

var cogs: Array[cog_base] = []
var name: String = ""

func get_cogs():
	return cogs

func get_cog(index: int):
	return cogs[index]

func add(cog: cog_base):
	cogs.append(cog)
	pass

func size(): return cogs.size() - 1
func get_end_cog():	return cogs.back()

func _init(_name: String):
	name = _name
	pass
