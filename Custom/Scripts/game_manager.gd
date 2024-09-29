extends Node
class_name GameManager

var has_resource: bool = false
var task_completed: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if task_completed >= 1:
		get_tree().change_scene_to_file("res://Custom/Scenes/win_scene.tscn")

func is_value_true() -> bool:
	return has_resource
