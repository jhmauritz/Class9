extends Control

@export var Back : Button

enum Menu { MAIN_MENU, SETTINGS_MENU, AUDIO_SETTINGS, VIDEO_SETTINGS, CREDITS, ACCESSIBILITY, LOAD_MENU }

@export var transition_path : PackedScene

var current_menu : Menu = Menu.CREDITS

# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
#	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass


func _on_credits_pressed():
	current_menu = Menu.CREDITS
	print("credits")
