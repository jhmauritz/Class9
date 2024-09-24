extends Node

@onready var interaction_area: InteractionArea = $InteractionBound

func _ready() -> void:
	interaction_area.interact = Callable(self, "_on_interact")
	
func _on_interact():
	if GM.has_resource == false:
		GM.has_resource = true
		print("Collected Resource!")
	else:
		print("No Resource Dumby!")
