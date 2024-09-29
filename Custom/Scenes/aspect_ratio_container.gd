extends AspectRatioContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_retry_pressed() -> void:
	$"../../On Click".play()
	
	


func _on_retry_mouse_entered() -> void:
	$"../../On Hover".play()


func _on_quit_pressed() -> void:
	$"../../On Click".play()


func _on_quit_mouse_entered() -> void:
	$"../../On Hover".play()
