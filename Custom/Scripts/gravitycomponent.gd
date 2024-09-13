extends Node
class_name GravityComponent

@export_subgroup("Settings")
@export var gravity : float = 1000.0

var isfalling : bool = false

func handle_gravity(body: CharacterBody2D, delta: float) -> void:
	if not body.is_on_floor():
		body.velocity.y += gravity * delta
	
	isfalling = body.velocity.y > 0 and not body.is_on_floor()
