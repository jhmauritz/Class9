extends Control

enum Menu { MAIN_MENU, SETTINGS_MENU, AUDIO_SETTINGS, VIDEO_SETTINGS, CREDITS, ACCESSIBILITY, LOAD_MENU }
@export var transition_path : PackedScene

@export var audio : Button
@export var video : Button
@export var credits : Button
@export var accessibility : Button
@export var back : Button


var current_menu : Menu = Menu.SETTINGS_MENU

func _enter_tree():
	audio.pressed.connect(_on_audio_pressed)
	video.pressed.connect(_on_video_pressed)
	credits.pressed.connect(_on_credits_pressed)
	accessibility.pressed.connect(_on_access_pressed)
	back.pressed.connect(_on_back_pressed)

func _exit_tree(): 
	audio.pressed.disconnect(_on_audio_pressed)
	video.pressed.disconnect(_on_video_pressed)
	credits.pressed.disconnect(_on_credits_pressed)
	accessibility.pressed.disconnect(_on_access_pressed)
	back.pressed.disconnect(_on_back_pressed)

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
