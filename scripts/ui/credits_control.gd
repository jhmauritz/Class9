extends Control

@export var Back : Button

enum Menu { MAIN_MENU, SETTINGS_MENU, AUDIO_SETTINGS, VIDEO_SETTINGS, CREDITS, ACCESSIBILITY, LOAD_MENU }

@export var transition_path : PackedScene

var current_menu : Menu = Menu.CREDITS

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
	current_menu = Menu.SETTINGS_MENU

func _on_credits_pressed():
	current_menu = Menu.CREDITS
	print("credits")
