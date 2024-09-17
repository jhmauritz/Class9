extends Control

enum Menu { MAIN_MENU, SETTINGS_MENU, AUDIO_SETTINGS, VIDEO_SETTINGS, CREDITS, ACCESSIBILITY, LOAD_MENU }

@export var loadbutton : Button
@export var menubutton : Button

@export var transition_path : PackedScene


var current_menu : Menu = Menu.LOAD_MENU

func _enter_tree():
	loadbutton.pressed.connect(_on_loadbutton_pressed)
	menubutton.pressed.connect(_on_menubutton_pressed)

func _exit_tree():
	loadbutton.pressed.disconnect(_on_loadbutton_pressed)
	menubutton.pressed.disconnect(_on_menubutton_pressed)

func _on_loadbutton_pressed():
	SaveManager.load_game()

func _on_menubutton_pressed():
	current_menu = Menu.MAIN_MENU
	

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
