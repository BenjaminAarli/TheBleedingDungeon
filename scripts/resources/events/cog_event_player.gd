extends cog_event
class_name cog_event_player

# Remember: update if player gets more editable values.
enum edit_value {
	HP 			= 1, 
	HP_MAX 		= 2, 
	MONEY 		= 3, 
	CONDITION 	= 4, 
	REMOVE_CONDITIONS = 5
	}
enum change_type {
	ADD 	= 1, 
	CONVERT = 2
	}

var edit   : edit_value  # The player value being edited.
var change : change_type # Type of change (Add/Convert/Other)

# The new value we use to (change/add) with the old value.
# IMPORTANT: We use INTs and STRINGs (so don't add a edit to it) 
var new_value

func edit_player(player: GDPlayer):
	match edit:
		edit_value.HP:
			edit_player_health(player)
		edit_value.HP_MAX:
			edit_player_health_max(player)
		edit_value.MONEY:
			edit_player_money(player)
		edit_value.CONDITION:
			player.conditions.append(new_value)
		edit_value.REMOVE_CONDITIONS:
			player.conditions.clear()
	pass

func edit_player_health(player: GDPlayer):
	match change_type:
		change_type.ADD:
			player.health += new_value
		change_type.CONVERT:
			player.health = new_value
	pass

func edit_player_health_max(player: GDPlayer):
	match change_type:
		change_type.ADD:
			player.health_max += new_value
		change_type.CONVERT:
			player.health_max = new_value
	pass

func edit_player_money(player):
	match change_type:
		change_type.ADD:
			player.money += new_value
		change_type.CONVERT:
			player.money = new_value
	pass
