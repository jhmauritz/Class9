extends CharacterBody2D

@export_subgroup("Nodes")
@export var gravity_component : GravityComponent
@export var input_component : InputComponent
@export var movement_component : MovementComponent
@export var animation_component : AnimationComponent
@export var jump_component : JumpComponent

@export var label_complete: Label
@export var label_resource: Label

func _physics_process(delta: float) -> void:
	gravity_component.handle_gravity(self, delta)
	movement_component.handle_horizontal_movement(self, input_component.input_horizontal)
	animation_component.handle_move_animation(input_component.input_horizontal)
	jump_component.handle_jump(self, input_component.get_jump_input())
	
	move_and_slide()
	
	label_complete.text = "Done: " + str(ceil(GM.task_completed)) + "/4"
	label_resource.text = "Has: " + str(GM.has_resource)
