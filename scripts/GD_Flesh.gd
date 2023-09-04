extends Resource
class_name GDFlesh

signal has_died

var is_dead = false

var health = 5
var health_max = 5

func heal_max(): health = health_max
func heal(amount: int): health = min(health + amount, health_max) 
func hurt(amount: int): health = max(health - amount, 0) 
