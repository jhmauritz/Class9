extends Node

#@onready var game_manager: GameManager = get_node("/root/game")
@onready var interaction_area: InteractionArea = $InteractionBound
@onready var timer_label: Label = $Label
@export var death_timer: Timer
@export var red_color: Color
@export var yellow_color: Color
@export var original_color: Color

var task_started = false
var task_running = false

func _ready() -> void:
	interaction_area.interact = Callable(self, "_on_interact")
	timer_label.hide()
	timer_label.modulate = original_color
	
func _process(delta: float) -> void:
	update_label_text()
	if task_started == true:
		_task_started()
		task_started = false
	
	if death_timer.time_left <= 30 && death_timer.time_left >= 15:
		timer_label.modulate = original_color
	elif death_timer.time_left <= 14 && death_timer.time_left >= 6:
		timer_label.modulate = yellow_color
	if death_timer.time_left <= 5:
		timer_label.modulate = red_color
	
func _on_interact():
	if GM.has_resource == true:
		GM.has_resource = false
		task_started = true
	elif task_running == true && death_timer.time_left <= 5:
		death_timer.stop()
		GM.task_completed += 1
	else:
		print("No Resource Dumby!")
		
func _task_started():
	death_timer.start()
	timer_label.show()
	task_running = true
	print(death_timer.time_left)

func _on_timer_timeout() -> void:
	if task_running == true:
		get_tree().change_scene_to_file("res://Custom/Scenes/lose_scene.tscn")
		
func update_label_text():
	timer_label.text = str(ceil(death_timer.time_left))
