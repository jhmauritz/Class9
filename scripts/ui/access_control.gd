extends Control

enum Menu { MAIN_MENU, SETTINGS_MENU, AUDIO_SETTINGS, VIDEO_SETTINGS, CREDITS, ACCESSIBILITY, LOAD_MENU }
@export var savesettings : Button
@export var back : Button
@export var captions : CheckButton
@export var language : OptionButton
@export var transition_path : PackedScene

var current_menu : Menu = Menu.ACCESSIBILITY

#func _enter_tree():
#	captions.pressed.connect(_on_captions_pressed)
	


#func _exit_tree():
#	captions.pressed.disconnect(_on_captions_pressed)
	
	

#func _on_captions_pressed():
#	captions.


# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
#	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass


func _on_accessibility_pressed():
	current_menu = Menu.ACCESSIBILITY
	print("access")
