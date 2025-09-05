extends Node2D

func  handle_bullet_spawned(bullet, position, direction):
	add_child(bullet)
