extends CharacterBody2D
@export var bullet :PackedScene
@export var speed: float = 200.0
@export var reload_time: float = 1.5
@onready var shot_cooldown = $ShotCooldown
@onready var muzzle = $Muzzle
@onready var max_ammo = 12
@onready var ammo_label = $"../CanvasLayer/Control/ammo_label"
@onready var ammo_count = max_ammo 
@onready var reload_timer = $reload_timer
@onready var reload_sound = $Muzzle/reload_sound
var reloading: bool = false
func _ready() -> void:
	update_ui()

func update_ui():
	ammo_label.text = str(ammo_count) + " / " + str(max_ammo)

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
	
	if Input.is_action_pressed("reload"):
		reload()
func reload():
	if not reloading and ammo_count < max_ammo:
		reloading = true
		reload_sound.play()
		reload_timer.start(reload_time)
	
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_released("shoot"):
		shoot()
		update_ui()
		
		
func shoot():
		if reloading:
			print("reloading")
			return
		if shot_cooldown.is_stopped():
			if ammo_count > 0:
				$Muzzle/shooting_sound.play()
				var bullet_instance = bullet.instantiate()
				get_parent().add_child(bullet_instance)
				bullet_instance.position = muzzle.global_position 
				bullet_instance.rotation = muzzle.rotation
				var target = get_global_mouse_position()
				var direction = Vector2.RIGHT.rotated(rotation)
				bullet_instance.set_direction(direction)
				ammo_count -= 1
				shot_cooldown.start()
			else:
				$Muzzle/empty_sound.play()
		else:
			print("You are shooting too fast.")


func _on_reload_timer_timeout() -> void:
	ammo_count = max_ammo
	reloading = false
	update_ui()
