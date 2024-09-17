@tool

extends AspectRatioContainer

func _ready() -> void:
	var viewport_width = ProjectSettings.get_setting("display/window/size/viewport_width")
	var viewport_height = ProjectSettings.get_setting("display/window/size/viewport_height")
	
	size = Vector2(viewport_width, viewport_height)


func _on_return_main_menu_button_pressed() -> void:
	pass # Replace with function body.
	

func _on_access_button_pressed() -> void:
	pass
	

func _on_credits_button_pressed() -> void:
	pass

func _on_video_button_pressed() -> void:
	pass
	
func _on_audio_button_pressed() -> void:
	pass

func _on_save_button_pressed() -> void:
	pass
	
func _on_back_button_pressed() -> void:
	pass
	
func _on_load_button_pressed() -> void:
	pass
	
