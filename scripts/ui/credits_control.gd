extends Control

@export var Back : Button

enum Menu { MAIN_MENU, LOAD_MENU , SETTINGS_MENU, AUDIO_SETTINGS, VIDEO_SETTINGS, CREDITS, ACCESSIBILITY }

@export var transition_path : PackedScene

var current_menu : Menu = Menu.AUDIO_SETTINGS

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
