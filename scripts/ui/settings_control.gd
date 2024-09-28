extends Control 

class_name MenuSetting


@export var transition_path : PackedScene

@export var audio : Button
@export var video : Button
@export var credits : Button
@export var accessibility : Button
@export var back : Button


var current_menu = MenuEnums.Menu.SETTINGS

func _ready():
	audio.pressed.connect(_on_audio_pressed)
	video.pressed.connect(_on_video_pressed)
	credits.pressed.connect(_on_credits_pressed)
	accessibility.pressed.connect(_on_access_pressed)
	back.pressed.connect(_on_back_pressed)

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


func _on_audio_pressed():
	get_tree().change_scene_to_file("res://Custom/Scenes/Audio_Scene.tscn")
	
func _on_video_pressed():
	get_tree().change_scene_to_file("res://Custom/Scenes/Video_scene.tscn")

func _on_credits_pressed():
	get_tree().change_scene_to_file("res://Custom/Scenes/credits_Scene.tscn")

func _on_access_pressed():
	get_tree().change_scene_to_file("res://Custom/Scenes/Accessibility_Scene.tscn")

func _on_back_pressed() :
	get_tree().change_scene_to_file("res://Custom/Scenes/MainMenu_Scene.tscn")
