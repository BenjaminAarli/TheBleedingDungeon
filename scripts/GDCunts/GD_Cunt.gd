extends Resource
class_name GDCunt

# Container as a Universal Non-node Toolkit. CUNT.

var list: Array = [] : 
	set(_item): changed.emit()

func add_item(item): 
	if not list.has(item):
		list.append(item)
func remove_item(name: String): 
	var index = list.find(name)
	if index: 
		list.pop_at(index)
func get_item_index(cname: String): return list.find(cname)
func get_item(index: int): 			return list[index]
func get_items(): 					return list
func clear(): 						list.clear()
func size():  						return list.size()

func get_item_names():
	var lst = []
	for item in list:
		lst.append(item.name)
	return lst

# Compares two cunts and returns the difference between them.
func get_difference(other: GDCunt):
	var diff: Array = []
	var lst = list.duplicate()
	var ost = other.list.duplicate()
	var com = lst + ost
	for c in com: 
		if not lst.has(c) or not ost.has(c):
			diff.append(c)
	return diff


