extends Node

#@onready var game_manager: GameManager = get_node("/root/game")
@onready var interaction_area: InteractionArea = $InteractionBound
@export var death_timer: Timer
var task_started = false
var task_running = false

func _ready() -> void:
	interaction_area.interact = Callable(self, "_on_interact")
	print(death_timer)
	
func _process(delta: float) -> void:
	if task_started == true:
		_task_started()
		task_started = false
	
func _on_interact():
	if GM.has_resource == true:
		GM.has_resource = false
		task_started = true
		print("Has Reouce! Starting Timer")
	elif task_running == true:
		death_timer.stop()
		print("win")
		#add path to win screen
		#get_tree().change_scene_to_file()
	else:
		print("No Resource Dumby!")
		
func _task_started():
	death_timer.start()
	task_running = true
	print(death_timer.time_left)


#func _on_timer_timeout() -> void:
	#add in transition scene
	#get_tree().change_scene_to_file()
	#print("Dead")
	#pass # Replace with function body.


func _on_timer_timeout() -> void:
	if task_running == true:
		print("Dead")
		# add lose screen path
		#get_tree().change_scene_to_file()
	pass # Replace with function body.
