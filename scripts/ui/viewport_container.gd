@tool

extends AspectRatioContainer

func _ready() -> void:
	var viewport_width = ProjectSettings.get_setting("display/window/size/viewport_width")
	var viewport_height = ProjectSettings.get_setting("display/window/size/viewport_height")
	
	size = Vector2(viewport_width, viewport_height)


func _on_check_button_pressed() -> void:
	$"../On Click".play()
	


func _on_check_button_mouse_entered() -> void:
	$"../On Hover".play()


func _on_options_button_pressed() -> void:
	$"../On Click".play()


func _on_options_button_mouse_entered() -> void:
	$"../On Hover".play()


func _on_save_pressed() -> void:
	$"../On Click".play()


func _on_save_mouse_entered() -> void:
	$"../On Hover".play()


func _on_return_pressed() -> void:
	$"../On Click".play()
	

func _on_return_mouse_entered() -> void:
	$"../On Hover".play()


func _on_h_slider_drag_started() -> void:
	$"../On Click".play()


func _on_h_slider_drag_ended(value_changed: bool) -> void:
	$"../On Click".play()


func _on_h_slider_2_drag_started() -> void:
	$"../On Click".play()
	

func _on_h_slider_2_drag_ended(value_changed: bool) -> void:
	$"../On Click".play()


func _on_h_slider_3_drag_started() -> void:
	$"../On Click".play()


func _on_h_slider_3_drag_ended(value_changed: bool) -> void:
	$"../On Click".play()


func _on_audio_button_pressed() -> void:
	$"../On Click".play()


func _on_audio_button_mouse_entered() -> void:
	$"../On Hover".play()


func _on_video_pressed() -> void:
	$"../On Click".play()
	

func _on_video_mouse_entered() -> void:
	$"../On Hover".play()


func _on_credits_pressed() -> void:
	$"../On Click".play()


func _on_credits_mouse_entered() -> void:
	$"../On Hover".play()


func _on_accessibility_pressed() -> void:
	$"../On Click".play()


func _on_accessibility_mouse_entered() -> void:
	$"../On Hover".play()


func _on_back_pressed() -> void:
	$"../On Click".play()


func _on_back_mouse_entered() -> void:
	$"../On Hover".play()


func _on_label_mouse_entered() -> void:
	$"../On Hover".play()


func _on_label_2_mouse_entered() -> void:
	$"../On Hover".play()


func _on_label_3_mouse_entered() -> void:
	$"../On Hover".play()


func _on_option_button_item_focused(index: int) -> void:
	$"../On Hover".play()


func _on_option_button_pressed() -> void:
	$"../On Hover".play()


func _on_option_button_2_item_focused(index: int) -> void:
	$"../On Hover".play()


func _on_option_button_2_pressed() -> void:
	$"../On Hover".play()


func _on_option_button_2_item_selected(index: int) -> void:
	$"../On Click".play()

func _on_option_button_item_selected(index: int) -> void:
	$"../On Click".play()


func _on_load_button_pressed() -> void:
	$"../On Click Sound".play()


func _on_save_button_pressed() -> void:
	$"../On Click Sound".play()


func _on_settings_button_pressed() -> void:
	$"../On Click Sound".play()


func _on_quit_button_pressed() -> void:
	$"../On Click Sound".play()


func _on_load_button_mouse_entered() -> void:
	$"../On Hover Sound".play()


func _on_save_button_mouse_entered() -> void:
	$"../On Hover Sound".play()


func _on_settings_button_mouse_entered() -> void:
	$"../On Hover Sound".play()


func _on_quit_button_mouse_entered() -> void:
	$"../On Hover Sound".play()
