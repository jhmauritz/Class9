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


func _on_audio_pressed() -> void:
	match current_menu:
		MenuEnums.Menu.AUDIO:
			print_tree()
	pass
	
func _on_video_pressed() -> void:
	pass
	#current_menu = Menu.VIDEO_SETTINGS

func _on_credits_pressed() -> void:
	pass
	#current_menu = Menu.CREDITS

func _on_access_pressed() -> void:
	pass
	#current_menu = Menu.ACCESSIBILITY

func _on_back_pressed() :
	current_menu = MenuEnums.Menu.MAIN
