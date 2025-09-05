extends CharacterBody2D
@export var bullet :PackedScene
@export var speed: float = 200.0

@onready var muzzle = $Muzzle

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
	get_parent().add_child(bullet_instance)
	# muzzle
	bullet_instance.position = muzzle.global_position 
	# 
	bullet_instance.rotation = muzzle.rotation
	var target = get_global_mouse_position()
	var direction = Vector2.RIGHT.rotated(rotation)
	bullet_instance.set_direction(direction)
	
	print("shot fired")
