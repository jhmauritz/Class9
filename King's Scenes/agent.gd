extends CharacterBody2D

var speed = 60
var gravity = 1000.0
var facing_left = false
var allow_flip = false
@export var platform_width = 200  # Adjust this to match your platform's width

@onready var sprite = $AnimatedSprite2D  # Assuming you have an AnimatedSprite2D node
@onready var player_detection = $PlayerDetection  # Add an Area2D node for player detection

func _ready():
	# Initialize the animation
	if sprite:
		sprite.play("walk")

func _physics_process(delta: float) -> void:
	# Add gravity
	#print("not on floor")
	velocity.y += gravity * delta

	# Move back and forth
	velocity.x = -speed if facing_left else speed

	# Check if we need to turn around
	if position.x <= 0:
		flip()
		velocity.x = speed
	if position.x >= platform_width:
		flip()
		velocity.x = -speed

	move_and_slide()
	update_animation()

func flip():
	facing_left = !facing_left
	scale.x = -scale.x  # Flip the sprite
	

func update_animation():
	if sprite:
		if velocity.x != 0: 
			sprite.play("walk")
		else:
			sprite.play("idle")

	# Ensure the sprite is facing the correct direction
	if velocity.x < 0:
		sprite.flip_h = false
	elif velocity.x < 0:
		sprite.flip_h = true
func _on_player_detection_body_entered(body):
	if body.name == "Player":
		print("Player detected! You Lose")
