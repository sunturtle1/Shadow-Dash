extends Area2D
@export var speed: float = 1000
@onready var timer_stop = $Timer

var direction := Vector2.ZERO


func _physics_process(delta: float) -> void:
	if direction != Vector2.ZERO:
		var velocity = direction * speed * delta
		global_position += velocity

func _ready() -> void:
	timer_stop.start()
func set_direction(direction: Vector2) -> void:
	self.direction = direction
	rotation = direction.angle()


func _on_timer_timeout() -> void:
	queue_free()
	



func _on_body_entered(body: Node2D) -> void:
	print("yes a hit!")
	queue_free()
	if body.is_in_group("enemies"):
		body.take_damage(30)
	
