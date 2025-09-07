extends Area2D
@export var speed: float = 1000

var direction := Vector2.ZERO
@onready var timer_stop = $Timer

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
