class_name InventoryMenu extends Control

@export var is_on: bool = true
@onready var inventory_panel = $InventoryPanel
@onready var grid_container = $InventoryPanel/GridContainer

var max_items = 16
var item_slots = []

func _ready():
	is_on = false
	inventory_panel.visible = false
	create_inventory_slots()

func _input(event: InputEvent):
	if event.is_action_pressed("open_inventory"):
		is_on = !is_on
		inventory_panel.visible = is_on

func create_inventory_slots():
	for i in range(max_items):
		var slot = Label.new()
		slot.text = "Empty"
		grid_container.add_child(slot)
		item_slots.append(slot)
