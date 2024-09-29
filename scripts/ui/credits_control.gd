extends Control

@export var Back : Button


@export var transition_path : PackedScene

var current_menu = MenuEnums.Menu.CREDITS

 #Called when the node enters the scene tree for the first time.
#func _ready():
#	back.pressed.connect(_on_back_pressed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass

func _enter_tree():
	Back.pressed.connect(_back_to_setting)
	
func _exit_tree():
	Back.pressed.disconnect(_back_to_setting)
	

func _back_to_setting():
	get_tree().change_scene_to_file("res://Custom/Scenes/Settings_Scene.tscn")

func _on_credits_pressed():
	get_tree().change_scene_to_file("res://Custom/Scenes/credits.tscn")
