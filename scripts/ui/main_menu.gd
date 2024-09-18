extends Control

enum Menu { MAIN_MENU, SETTINGS_MENU, AUDIO_SETTINGS, VIDEO_SETTINGS, CREDITS, ACCESSIBILITY, LOAD_MENU }

@export var start_button : Button
@export var load_button : Button
@export var settings_button : Button
@export var exit_button : Button

@export var start_scene_path : PackedScene
@export var transition_path : PackedScene

var current_menu : Menu = Menu.MAIN_MENU

func _enter_tree():
	start_button.pressed.connect(_on_start_button_pressed)
	settings_button.pressed.connect(_on_settings_pressed)
	load_button.pressed.connect(_on_load_pressed)
	exit_button.pressed.connect(_on_exit_pressed)
	
func _exit_tree():
	start_button.pressed.disconnect(_on_start_button_pressed)
	load_button.pressed.disconnect(_on_load_pressed)
	settings_button.pressed.disconnect(_on_settings_pressed)
	exit_button.pressed.disconnect(_on_exit_pressed)

func _on_start_button_pressed():
	SceneTransitionManager.change_scene_with_transition(
		start_scene_path,
		transition_path
	)

func _on_exit_pressed():
	get_tree().exit()

func _on_settings_pressed():
	current_menu = Menu.SETTINGS_MENU
	print("settings")

func _on_load_pressed():
	current_menu = Menu.LOAD_MENU
	print("load")



func _on_back_pressed():
	current_menu = Menu.MAIN_MENU
	print("menu")
