class_name InventoryMenu extends Control

@export var is_on: bool = true
@onready var InventoryPanel = $InventoryPanel
@onready var GridControl = $InventoryPanel/GridControl

var max_items = 8
var item_slots = []

func _ready():
	is_on = false
	InventoryPanel.visible = false
	create_inventory_slots()

func _input(event: InputEvent):
	if event.is_action_pressed("open_inventory"):
		print("Y key pressed")  # Debug message
		is_on = !is_on
		InventoryPanel.visible = is_on
		print("Inventory is now:", is_on)  # Check the state of the inventory

func create_inventory_slots():
	for i in range(max_items):
		var slot = Label.new()
		slot.text = "Empty"
		GridControl.add_child(slot)
		item_slots.append(slot)
