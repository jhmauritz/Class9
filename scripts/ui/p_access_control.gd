extends Control

@export var savesettings : Button
@export var back : Button
@export var captions : CheckButton
@export var language : OptionButton
@export var transition_path : PackedScene

var current_menu = MenuEnums.Menu.ACCESSIBILITY

func _enter_tree():
	captions.pressed.connect(_on_captions_pressed)
	language.pressed.connect(_languages)
	savesettings.pressed.connect(_save_access_settings)
	back.pressed.connect(_back_to_settings)



func _exit_tree():
	captions.pressed.disconnect(_on_captions_pressed)
	language.pressed.disconnect(_languages)
	savesettings.pressed.disconnect(_save_access_settings)
	back.pressed.disconnect(_back_to_settings)

func _on_captions_pressed():
	pass

func _save_access_settings():
	pass

func _languages():
	pass

func _back_to_settings():
	get_tree().change_scene_to_file("res://Custom/Scenes/P_Settings_Scene.tscn")

func _on_accessibility_pressed():
	get_tree().change_scene_to_file("res://Custom/Scenes/P_Accessibility_Scene.tscn")


# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
#	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
