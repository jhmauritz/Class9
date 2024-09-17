extends Control

@export var menu : Button
@export var retry : Button

@export var menu_scene_path : PackedScene
@export var start_scene_path : PackedScene
@export var transition_path : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _enter_tree():
	menu.pressed.connect(_on_menu_pressed)
	retry.pressed.connect(_on_retry_pressed)

func _exit_tree():
	menu.pressed.disconnect(_on_menu_pressed)
	retry.pressed.disconnect(_on_retry_pressed)

func _on_retry_pressed():
	SceneTransitionManager.change_scene_with_transition(
	start_scene_path,
	transition_path
)

func _on_menu_pressed():
	SceneTransitionManager.change_scene_with_transition(
	menu_scene_path,
	transition_path
	)
