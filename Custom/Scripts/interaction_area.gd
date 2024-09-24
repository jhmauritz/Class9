extends Area2D
class_name InteractionArea

@export var action_name: String = "interact"
@onready var im: InteractionManager = $InteractionManager

var interact: Callable = func():
	pass
	


func _on_body_entered(body: Node2D) -> void:
	IM.register_area(self)


func _on_body_exited(body: Node2D) -> void:
	IM.unregister_area(self)
