extends Area2D
class_name InteractionArea

@export var action_name: String = "interact"

var interact: Callable = func():
	pass
	

func _on_body_entered(body):
	print("entered")
	IM.register_area(self)


func _on_body_exited(body):
	print("exited")
	IM.unregister_area(self)
