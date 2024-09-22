extends Control

enum Menu { MAIN_MENU, LOAD_MENU, SETTINGS_MENU, AUDIO_SETTINGS, VIDEO_SETTINGS, CREDITS, ACCESSIBILITY }

@export var transition_path : PackedScene

@export var savesettings : Button
@export var back : Button
@export var brightness_slider : Slider
@export var video1_slider : Slider
@export var windowmode : OptionButton

var current_menu : Menu = Menu.VIDEO_SETTINGS



#func 
#var  = ProjectSettings.get_setting(display/window/size/borderless)

#@onready var brightness_bus = AudioServer.get_bus_index('Master')
#@onready var music_bus = AudioServer.get_bus_index('Music')
#@onready var sfx_bus = AudioServer.get_bus_index('SFX')

#func _enter_tree():
#	brightness_slider_slider.value_changed.connect(_on_brightness_value_changed)
#	video1_slider_slider.value_changed.connect(_on_music_audio_value_changed)
#	video2_slider_slider.value_changed.connect(_on_sfx_audio_value_changed)

#func _exit_tree():
#	brightness_slider_slider.value_changed.disconnect(_on_master_audio_value_changed)
#	video1_slider_slider.value_changed.disconnect(_on_music_audio_value_changed)
#	video2_slider_slider.value_changed.disconnect(_on_sfx_audio_value_changed)

#func _ready():
#	brightness_slider_slider.value = db_to_linear(AudioServer.get_bus_volume_db(master_bus))
#	video1_slider_slider.value = db_to_linear(AudioServer.get_bus_volume_db(music_bus))
#	video2_slider_slider.value = db_to_linear(AudioServer.get_bus_volume_db(sfx_bus))
#	

#func _on_master_audio_value_changed(value):
#	AudioServer.set_bus_volume_db(
#		master_bus,
#		linear_to_db(value)
#	)


#func _on_sfx_audio_value_changed(value):
#	AudioServer.set_bus_volume_db(
#		sfx_bus,
#		linear_to_db(value)
#	)


#func _on_music_audio_value_changed(value):
#	AudioServer.set_bus_volume_db(
#		music_bus,
#		linear_to_db(value)
#	)


#func _on_video_pressed():
#	current_menu = Menu.VIDEO_SETTINGS
#	print("video")


func _on_video_pressed():
	current_menu = Menu.VIDEO_SETTINGS