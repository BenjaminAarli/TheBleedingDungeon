extends EditorSectorScript

@onready var eDabs = %DabEditor
@onready var dabs: Dabs = %Dabs

var chain: GDChain

func set_chain(_chain: GDChain):
	chain = _chain
	pass

