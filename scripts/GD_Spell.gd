extends Resource
class_name GDSpell

enum target_type {SELF, ALLY, ENEMY, ALL_ALLIES, ALL_ENEMIES, ALL}
var target: target_type = target_type.SELF

enum spell_type {HEAL, HURT, SPECIAL}
var type: spell_type = spell_type.HEAL

var amount: int = 0

func cast(caster, target):
	var targets: Array = get_targets()
	pass

func get_targets():
	match target:
		0:
			pass
		1: 
			pass
		2: 
			pass
		3:
			pass
		4:
			pass
	pass
