class_name PauseMenu extends Control

enum PausedMenus { PAUSED_SCREEN, SETTING_SCREEN, AUDIO_SCREEN, VIDEO_SCREEN, CREDITS_SCREEN, ASSCESS_SCREEN, SAVE_SCREEN }

@export var is_paused : BoolReference



var current_menu : PausedMenus = PausedMenus.PAUSED_SCREEN

func _enter_tree():
	is_paused.on_value_changed.connect(_on_pause_changed)
	
func _exit_tree():
	is_paused.on_value_changed.disconnect(_on_pause_changed)

func _ready():
	is_paused.value = false

func _input(event : InputEvent):
	if event.is_action_pressed("ui_cancel"):
		is_paused.value = !get_tree().paused

func _on_pause_changed(_old_value : bool, value : bool):
	if value:
		pause()
	else:
		resume()

func pause():
	get_tree().paused = true
	visible = true
	
func resume():
	get_tree().paused = false
	visible = false

func _pause_game():
	if (Input.is_action_just_pressed("Pause")):
		pause()
	else:
		resume()
		
	
