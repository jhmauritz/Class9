extends CharacterBody2D

signal hit

@export var speed = 400
@export var gravity_var = 200
var screensize


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screensize = get_viewport_rect().size
	
func _physics_process(delta: float):
	velocity.y += gravity_var * delta
	horizontal_movement()
	move_and_slide()
	
func horizontal_movement():
	var horizontal_input = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	velocity.x = horizontal_input * speed



	#if velocity.x != 0:
		#$AnimatedSprite2D.animation = "walk"
		#$AnimatedSprite2D.flip_h = velocity.x < 0
