extends Node

func cast(spellname, caster, target: GDNPC, gameEngine: GameEngine):
	match spellname:
		# Special spell that awakens the dead
		"speak_with_dead": 	
			speak_with_dead(target, gameEngine)
		# Healing spell that heals the target
		"cure_wounds": 		
			cure_wounds(caster, target)
		# Attack spell that hurts the target.
		"inflict_wound": 	
			inflict_wound(caster, target)
		# Used to unlock doors, chests and such.
		"unlock": 			
			unlock(caster, target)
	pass

func unlock(caster, target: GDNPC):
	pass

func inflict_wound(caster, target: GDNPC):
	target.hurt(5)
	pass

func cure_wounds(caster, target: GDNPC):
	target.heal(5)
	pass

func speak_with_dead(target: GDNPC, gameEngine: GameEngine):
	gameEngine.current_story = target.speak_with_dead_chain
	pass
