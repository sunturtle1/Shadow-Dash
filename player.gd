extends CharacterBody2D
@export var bullet :PackedScene
@export var speed: float = 200.0

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	var move_direction := Vector2.ZERO
	if Input.is_action_pressed("up"):
		move_direction.y = -1
	if Input.is_action_pressed("down"):
		move_direction.y = 1
	if Input.is_action_pressed("left"):
		move_direction.x = -1
	if Input.is_action_pressed("right"):
		move_direction.x = 1
		
	move_direction = move_direction.normalized()
	
	velocity = move_direction * speed
	move_and_slide()
	
	
	look_at(get_global_mouse_position())
	
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_released("shoot"):
		shoot()
		
		
func shoot():
	var bullet_instance = bullet.instantiate()
	add_child(bullet_instance)
	print("shot fired")
