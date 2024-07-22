class_name Stats extends Resource

signal stats_changed

@export var max_health: int = 1
@export var art: Texture

var health: int:
	set(value):
		health = clampi(value, 0, max_health)
		stats_changed.emit()
var block: int:
	set(value):
		block = clampi(value, 0, 999)
		stats_changed.emit()


func take_damage(damage: int) -> void:
	if damage <= 0:
		return
	
	var initial_damage = damage
	damage = clampi(damage - block, 0, damage)
	self.block = clampi(block - initial_damage, 0, block)
	self.health -= damage


func heal(amount: int) -> void:
	self.health += amount
	stats_changed.emit()


func create_instance() -> Resource:
	var instance: Stats = self.duplicate()
	instance.health = max_health
	instance.block = 0
	return instance
