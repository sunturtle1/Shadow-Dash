extends Node2D
@onready var bullet_manager = $BulletManager
@onready var player = $Player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.connect("bullet_fired", bullet_manager.handle_bullet_spawned()) # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
