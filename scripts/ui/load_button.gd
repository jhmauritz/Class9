extends Button

func _ready():
	disabled = not SaveManager.has_save_file()

func _pressed():
	SaveManager.load_game()


func _on_pressed() -> void:
	$"../../../../On Click Sound".play()



func _on_mouse_entered() -> void:
	$"../../../../On Hover Sound".play()
	
