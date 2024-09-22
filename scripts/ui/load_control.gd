extends Control

enum Menu { MAIN_MENU, SETTINGS_MENU, AUDIO_SETTINGS, VIDEO_SETTINGS, CREDITS, ACCESSIBILITY, LOAD_MENU }

@export var loadbutton : Button
@export var back : Button

#@export var transition_path : PackedScene


var current_menu : Menu = Menu.LOAD_MENU

func _enter_tree():
	loadbutton.pressed.connect(_on_loadbutton_pressed)
	back.pressed.connect(_on_back_pressed)

func _exit_tree():
	loadbutton.pressed.disconnect(_on_loadbutton_pressed)
	back.pressed.disconnect(_on_back_pressed)

func _on_loadbutton_pressed():
	SaveManager.load_game()

func _on_back_pressed():
	current_menu = Menu.MAIN_MENU
	
