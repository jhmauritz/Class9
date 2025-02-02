extends Control


@export var savesettings : Button
@export var back : Button
@export var transition_path : PackedScene

@export var master_slider : Slider
@export var music_slider : Slider
@export var sfx_slider : Slider


@onready var master_bus = AudioServer.get_bus_index('Master')
@onready var music_bus = AudioServer.get_bus_index('Music')
@onready var sfx_bus = AudioServer.get_bus_index('SFX')

@onready var audio = Button

var current_menu = MenuEnums.Menu.AUDIO

func load_data() -> void:
	match AudioServer.get_bus_index:
		"Master":
			_on_master_audio_value_changed(SettingstDataCont.get_master_volume())
		"Music":
			_on_music_audio_value_changed(SettingstDataCont.get_music_volume())
		"SFX":
			_on_sfx_audio_value_changed(SettingstDataCont.get_sfx_volume())
	


func _enter_tree():
	savesettings.pressed.connect(_save_audio_settings)
	back.pressed.connect(_back_to_settings)
	master_slider.value_changed.connect(_on_master_audio_value_changed)
	music_slider.value_changed.connect(_on_music_audio_value_changed)
	sfx_slider.value_changed.connect(_on_sfx_audio_value_changed)



func _exit_tree():
	savesettings.pressed.disconnect(_save_audio_settings)
	back.pressed.disconnect(_back_to_settings)
	master_slider.value_changed.disconnect(_on_master_audio_value_changed)
	music_slider.value_changed.disconnect(_on_music_audio_value_changed)
	sfx_slider.value_changed.disconnect(_on_sfx_audio_value_changed)



func _ready():
	load_data()
	master_slider.value = db_to_linear(AudioServer.get_bus_volume_db(master_bus))
	music_slider.value = db_to_linear(AudioServer.get_bus_volume_db(music_bus))
	sfx_slider.value = db_to_linear(AudioServer.get_bus_volume_db(sfx_bus))

func _on_master_audio_value_changed(value):
	AudioServer.set_bus_volume_db(
		master_bus,
		linear_to_db(value)
)

func _on_sfx_audio_value_changed(value):
	AudioServer.set_bus_volume_db(
		sfx_bus,
		linear_to_db(value)
)

func _on_music_audio_value_changed(value):
	AudioServer.set_bus_volume_db(
		music_bus,
		linear_to_db(value)
	)
	


func _on_audio_pressed():
	get_tree().change_scene_to_file("res://Custom/Scenes/P_Audio_Scene.tscn")
	
	
	
func _save_audio_settings():
	pass
	
func _back_to_settings():
	get_tree().change_scene_to_file("res://Custom/Scenes/P_Settings_Scene.tscn")
	
