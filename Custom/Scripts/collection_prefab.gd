extends Node

@onready var interaction_area: InteractionArea = $InteractionBound

func _ready() -> void:
	interaction_area.interact = Callable(self, "_on_interact")
	
func _on_interact():
	if game_manager_class.has_resource == false:
		game_manager_class.has_resource = true
		print("Collected Resource!")
	else:
		print("No Resource Dumby!")
