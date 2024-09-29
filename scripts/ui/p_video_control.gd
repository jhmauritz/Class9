extends Control


@export var transition_path : PackedScene

#@export var savesettings : Button
@export var back : Button
@export var windowmode : OptionButton
@export var resolution : OptionButton

@onready var resolution_option = $"../MarginContainer/VBoxContainer/HBoxContainer/VBoxContainer2/P_resolution option" as OptionButton
@onready var windowmode_option = $"../MarginContainer/VBoxContainer/HBoxContainer/VBoxContainer2/P_windowmode option" as OptionButton

var current_menu = MenuEnums.Menu.VIDEO

const WINDOW_MODE_ARRAY : Array[String] = [
	"Windowed Mode",
	"Full-Screen",
	"Borderless Window",
	"Borderless Full-Screen"
]

const RESOLUTION_DICTIONARY : Dictionary = {
	"1152 x 648" : Vector2i(1152, 648),
	"1280 x 720" : Vector2i(1280, 720),
	"1920 x 1080" : Vector2i(1920, 1080)
}

func add_window_mode_items() -> void:
	for window_mode in WINDOW_MODE_ARRAY:
		windowmode.add_item(window_mode)

func _enter_tree():
#	brightness_slider_slider.value_changed.connect(_on_brightness_value_changed)
#	video1_slider_slider.value_changed.connect(_on_music_audio_value_changed)
#	video2_slider_slider.value_changed.connect(_on_sfx_audio_value_changed)
	#savesettings.pressed.connect(_save_video_settings)
	back.pressed.connect(_back_to_settings)

func _exit_tree():
#	brightness_slider_slider.value_changed.disconnect(_on_master_audio_value_changed)
#	video1_slider_slider.value_changed.disconnect(_on_music_audio_value_changed)
#	video2_slider_slider.value_changed.disconnect(_on_sfx_audio_value_changed)
	#savesettings.pressed.disconnect(_save_video_settings)
	back.pressed.disconnect(_back_to_settings)

func load_data() -> void:
	on_resolution_selected(SettingstDataCont.get_resolution_index())
	resolution_option.select(SettingstDataCont.get_resolution_index())
	on_window_mode_selected(SettingstDataCont.get_window_mode_index())
	windowmode_option.select(SettingstDataCont.get_window_mode_index())

func _ready():
	add_window_mode_items()
	add_resolution_items()
	load_data()
	windowmode_option.item_selected.connect(on_window_mode_selected)
	resolution_option.item_selected.connect(on_resolution_selected)


func on_window_mode_selected(index : int) -> void:
	match index:

		0: #WindowedMode
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
		1: #FullScreen
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
		2: #BorderlessWindow
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, true)
		3: #BorderlessFullScreen
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, true)


func add_resolution_items() -> void:
	for resolution_size_text in RESOLUTION_DICTIONARY:
		resolution.add_item(resolution_size_text)

func on_resolution_selected(index : int) -> void :
	DisplayServer.window_set_size(RESOLUTION_DICTIONARY.values()[index])


#func _save_video_settings() -> void:
	#pass

func _back_to_settings() -> void:
	get_tree().change_scene_to_file("res://Custom/Scenes/P_Settings_Scene.tscn")

func _on_video_pressed():
	get_tree().change_scene_to_file("res://Custom/Scenes/P_Video_scene.tscn")
