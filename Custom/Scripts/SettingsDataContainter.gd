extends Node

@onready var DEFAULT_SETTINGS : DefaultSettingsResource = preload("res://Custom/Settings/DefaultSettings.tres")


var captions_state : bool = false
var window_mode_index : int = 0
var resoluition_index : int = 0
var master_volume : float = 0.0
var music_volume : float = 0.0
var sfx_volume : float = 0.0

var loaded_data : Dictionary = {}

func _ready():
	handle_signals()
	create_storage_dict()

func get_window_mode_index() -> int:
	if loaded_data == {}:
		return DEFAULT_SETTINGS.DEFAULT_WINDOW_MODE_INDEX
	return window_mode_index

func get_resolution_index() -> int:
	if loaded_data == {}:
		return DEFAULT_SETTINGS.DEFAULT_RESOLUTION_INDEX
	return resoluition_index

func get_captions_toggled() -> bool:
	if loaded_data == {}:
		return DEFAULT_SETTINGS.DEFAULT_CAPTIONS_SET
	return captions_state

func get_master_volume() -> float:
	if loaded_data == {}:
		return DEFAULT_SETTINGS.DEFAULT_MASTER_VOLUME
	return master_volume

func get_music_volume() -> float:
	if loaded_data == {}:
		return DEFAULT_SETTINGS.DEFAULT_MUSIC_VOLUME
	return music_volume

func get_sfx_volume() -> float:
	if loaded_data == {}:
		return DEFAULT_SETTINGS.DEFUALT_SFX_VOLUME
	return sfx_volume



func create_storage_dict() -> Dictionary:
	var settings_container_dict : Dictionary = {
		"window_mode_index" : window_mode_index,
		"resoluition_index" : resoluition_index,
		"master_volume" : master_volume,
		"music_volume" : music_volume,
		"sfx_volume" : sfx_volume,
		"captions_state" : captions_state,
		#"move_left" : InputMap.action_get_events("move_left"),
		#"move_right" : InputMap.action_get_events("move_right"),
		#"move_down" : InputMap.action_get_events("move_down"),
		#"jump" : InputMap.action_get_events("Jump"),
		#"interact" : InputMap.action_get_events("interact"),
		#"pause" : InputMap.action_get_events("Pause"),
	
	}
	#print(settings_container_dict)
	return settings_container_dict


func on_captions_toggled(value : bool) -> void:
	captions_state = value
	print(captions_state)

func get_captions_state() -> bool:
	return captions_state

func on_window_mode_selected(index : int) -> void:
	window_mode_index = index

func on_resolution_selected(index : int) -> void:
	resoluition_index = index

func on_master_set(value : float) -> void: 
	master_volume = value

func on_music_set(value : float) -> void:
	music_volume = value

func on_sfx_set(value : float) -> void:
	sfx_volume = value

func on_settings_data_loaded(data : Dictionary) -> void:
	loaded_data = data
	on_window_mode_selected(loaded_data.window_mode_index)
	on_resolution_selected(loaded_data.resoluition_index)
	on_master_set(loaded_data.master_volume)
	on_music_set(loaded_data.music_volume)
	on_sfx_set(loaded_data.sfx_volume)
	on_captions_toggled(loaded_data.captions_state)
	
	

func handle_signals() -> void:
	SettingsSignalBus.window_mode_selected.connect(on_window_mode_selected)
	SettingsSignalBus.resolution_selected.connect(on_resolution_selected)
	SettingsSignalBus.on_master_sound_set.connect(on_master_set)
	SettingsSignalBus.on_music_sound_set.connect(on_music_set)
	SettingsSignalBus.on_sfx_sound_set.connect(on_sfx_set)
	SettingsSignalBus.on_captions_toggled.connect(on_captions_toggled)
	SettingsSignalBus.load_settings_data.connect(on_settings_data_loaded)
