extends Control

enum Menu { MAIN_MENU, LOAD_MENU , SETTINGS_MENU, AUDIO_SETTINGS, VIDEO_SETTINGS, CREDITS, ACCESSIBILITY }

@export var Audio : Button
@export var Video : Button
@export var Credits : Button
@export var Accessibility : Button
@export var Back : Button

@export var transition_path : PackedScene

var current_menu : Menu = Menu.SETTINGS_MENU

func _enter_tree():
	Audio.pressed.connect(_on_audio_pressed)
	Video.pressed.connect(_on_video_pressed)
	Credits.pressed.connect(_on_credits_pressed)
	Accessibility.pressed.connect(_on_access_pressed)
	Back.pressed.connect(_on_back_pressed)

func _exit_tree(): 
	Audio.pressed.disconnect(_on_audio_pressed)
	Video.pressed.disconnect(_on_video_pressed)
	Credits.pressed.disconnect(_on_credits_pressed)
	Accessibility.pressed.disconnect(_on_access_pressed)
	Back.pressed.disconnect(_on_back_pressed)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_audio_pressed():
	current_menu = Menu.AUDIO_SETTINGS
	
func _on_video_pressed():
	current_menu = Menu.VIDEO_SETTINGS
	
func _on_credits_pressed():
	current_menu = Menu.CREDITS

func _on_access_pressed():
	current_menu = Menu.ACCESSIBILITY

func _on_back_pressed():
	current_menu = Menu.MAIN_MENU
