extends Node

const GRAVITY = 1000
const SPEED = 1500

enum State { idle, walk }
var current_state : State


func _ready():
	current_state = State.idle



func _physics_process(delta: float) -> void:
	agent_gravity(delta)
	agent_idle(delta)
	

func agent_gravity(delta : float):
	velocity.y += GRAVITY * delta


func agent_idle(delta : float):
	velocity.x = move_towards(velocity.x,0, SPEED * delta)
	current_state = State.idle
