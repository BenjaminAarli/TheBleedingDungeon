extends GDCunt
class_name GDChains

const type = "GDChains"

var attachments = {}

func attach(chain: GDChain, other: GDChain):
	attachments[chain].append(other)
	pass

func add(chain: GDChain):
	add_to_attachments(chain)
	add_to_list(chain)
	pass

func add_to_attachments(chain: GDChain):
	attachments[chain] = []
	pass

func add_to_list(chain: GDChain):
	list.append(chain)
	pass

