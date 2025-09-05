extends Area2D
@export var speed: float = 500

var direction := Vector2.ZERO


func _physics_process(delta: float) -> void:
	if direction != Vector2.ZERO:
		var velocity = direction * speed * delta
		global_position += velocity


func set_direction(direction: Vector2) -> void:
	self.direction = direction
	rotation = direction.angle()
