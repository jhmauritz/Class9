extends Node

#@onready var game_manager: GameManager = get_node("/root/game")
@onready var interaction_area: InteractionArea = $InteractionBound
@onready var timer_label: Label = $Label
@export var death_timer: Timer
@export var red_color: Color
@export var yellow_color: Color
@export var original_color: Color

var og_time

var task_started = false
var task_running = false

func _ready() -> void:
	interaction_area.interact = Callable(self, "_on_interact")
	timer_label.hide()
	timer_label.modulate = original_color
	og_time = death_timer.wait_time
	
func _process(delta: float) -> void:
	update_label_text()
	if task_started == true:
		_task_started()
		task_started = false
	
	var timer_time = death_timer.time_left/og_time
	if timer_time <= 1 && timer_time >= .7:
		print(timer_time)
		timer_label.modulate = original_color
	elif timer_time <= .6 && timer_time >= .3:
		timer_label.modulate = yellow_color
	if timer_time <= .2:
		timer_label.modulate = red_color
	
func _on_interact():
	var time_percent = death_timer.time_left/og_time
	if GM.has_resource == true && task_running == false:
		GM.has_resource = false
		task_started = true
	elif task_running == true && time_percent <= .2:
		death_timer.stop()
		GM.task_completed += 1
		timer_label.hide()
		self.queue_free()
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
