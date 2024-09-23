extends Control

enum Menu { MAIN_MENU, SETTINGS_MENU, AUDIO_SETTINGS, VIDEO_SETTINGS, CREDITS, ACCESSIBILITY, LOAD_MENU }

#Menu
@export var start_button : Button
@export var load_button : Button
@export var settings_button : Button
@export var exit_button : Button

#Load
@export var loadbutton : Button
@export var backtosetting : Button

#Settings
@export var audio : Button
@export var video : Button
@export var credits : Button
@export var accessibility : Button
@export var back : Button

#Audio
@export var save_audio_settings : Button
@export var backto_settings : Button

#Video
@export var save_video_settings : Button
@export var backtosett : Button
@export var brightness_slider : Slider
@export var video1_slider : Slider
@export var windowmode : OptionButton

#Credits
@export var Backtosettings : Button

#Access
@export var save_acces_ssettings : Button
@export var backtoset : Button
@export var captions : CheckButton
@export var language : OptionButton


#Transitions
@export var start_scene_path : PackedScene
@export var transition_path : PackedScene


var current_menu : Menu = Menu.MAIN_MENU

func _enter_tree():
	#menu
	start_button.pressed.connect(_on_start_button_pressed)
	settings_button.pressed.connect(_on_settings_pressed)
	load_button.pressed.connect(_on_load_pressed)
	exit_button.pressed.connect(_on_exit_pressed)
	#settings
	audio.pressed.connect(_on_audio_pressed)
	video.pressed.connect(_on_video_pressed)
	credits.pressed.connect(_on_credits_pressed)
	accessibility.pressed.connect(_on_access_pressed)
	back.pressed.connect(_on_back_pressed)
	
	#load
	loadbutton.pressed.connect(_on_loadbutton_pressed)
	back.pressed.connect(_on_back_pressed)
	


	
func _exit_tree():
	#menu
	start_button.pressed.disconnect(_on_start_button_pressed)
	load_button.pressed.disconnect(_on_load_pressed)
	settings_button.pressed.disconnect(_on_settings_pressed)
	exit_button.pressed.disconnect(_on_exit_pressed)
	#settings
	audio.pressed.disconnect(_on_audio_pressed)
	video.pressed.disconnect(_on_video_pressed)
	credits.pressed.disconnect(_on_credits_pressed)
	accessibility.pressed.disconnect(_on_access_pressed)
	back.pressed.disconnect(_on_back_pressed)
	#load
	loadbutton.pressed.disconnect(_on_loadbutton_pressed)
	back.pressed.disconnect(_on_back_pressed)
	#audio
	
	#video
	
	#credits
	
	#access



func _on_start_button_pressed():
	SceneTransitionManager.change_scene_with_transition(
		start_scene_path,
		transition_path
	)


func _on_exit_pressed():
	get_tree().exit()
	print("bye")

func _on_settings_pressed():
	current_menu = Menu.SETTINGS_MENU
	print("current_menu")

func _on_load_pressed():
	current_menu = Menu.LOAD_MENU
	print("load")

func _on_audio_pressed():
	current_menu = Menu.AUDIO_SETTINGS
	print("audio")

func _on_video_pressed():
	current_menu = Menu.VIDEO_SETTINGS
	
func _on_credits_pressed():
	current_menu = Menu.CREDITS

func _on_access_pressed():
	current_menu = Menu.ACCESSIBILITY

func _on_loadbutton_pressed():
	SaveManager.load_game()


func _on_back_pressed():
	current_menu = Menu.MAIN_MENU
	print("menu")
