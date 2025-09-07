extends CharacterBody2D
@export var speed: float = 100
@export var max_hp: int = 100
var current_hp: int

func _ready() -> void:
	current_hp = max_hp

func take_damage(amount: int):
	current_hp -= amount
	if current_hp <= 0:
		die()

func die():
	queue_free()
