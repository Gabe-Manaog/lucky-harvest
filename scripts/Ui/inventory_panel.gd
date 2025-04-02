extends PanelContainer

@onready var log_label: Label = $MarginContainer/HBoxContainer/Logs/LogLabel
@onready var stone_label: Label = $MarginContainer/HBoxContainer/Stone/StoneLabel
@onready var corn_label: Label = $MarginContainer/HBoxContainer/Corn/CornLabel
@onready var tomato_label: Label = $MarginContainer/HBoxContainer/Tomato/TomatoLabel
@onready var egg_label: Label = $MarginContainer/HBoxContainer/Egg/EggLabel
@onready var milk_label: Label = $MarginContainer/HBoxContainer/Milk/MilkLabel
@onready var potato_label: Label = $MarginContainer/HBoxContainer/Potato/PotatoLabel
@onready var carrot_label: Label = $MarginContainer/HBoxContainer/Carrot/CarrotLabel
@onready var onion_label: Label = $MarginContainer/HBoxContainer/Onion/OnionLabel
@onready var radish_label: Label = $MarginContainer/HBoxContainer/Radish/RadishLabel
@onready var spinach_label: Label = $MarginContainer/HBoxContainer/Spinach/SpinachLabel
@onready var turnip_label: Label = $MarginContainer/HBoxContainer/Turnip/TurnipLabel



@onready var inventory_panel: PanelContainer = $"."


func _ready() -> void:
	var inventory: Dictionary = InventoryManager.inventory
	
	if inventory.has("log"):
		log_label.text = str(inventory["log"])
	
	if inventory.has("stone"):
		stone_label.text = str(inventory["stone"])
	
	if inventory.has("corn"):
		corn_label.text = str(inventory["corn"])
	
	if inventory.has("tomato"):
		tomato_label.text = str(inventory["tomato"])
	
	if inventory.has("potato"):
		potato_label.text = str(inventory["potato"])
	
	if inventory.has("carrot"):
		carrot_label.text = str(inventory["carrot"])
	
	if inventory.has("onion"):
		onion_label.text = str(inventory["onion"])
		
	if inventory.has("radish"):
		radish_label.text = str(inventory["radish"])
		
	if inventory.has("spinach"):
		spinach_label.text = str(inventory["spinach"])
		
	if inventory.has("turnip"):
		turnip_label.text = str(inventory["turnip"])
		
	if inventory.has("egg"):
		egg_label.text = str(inventory["egg"])
		
	if inventory.has("milk"):
		milk_label.text = str(inventory["milk"])

	InventoryManager.inventory_changed.connect(on_inventory_changed)

func _input(event):
	if event is InputEventKey and event.pressed and event.keycode == KEY_Q:
		inventory_panel.visible = !inventory_panel.visible

func on_inventory_changed() -> void:
	var inventory: Dictionary = InventoryManager.inventory
	
	if inventory.has("log"):
		log_label.text = str(inventory["log"])
	
	if inventory.has("stone"):
		stone_label.text = str(inventory["stone"])
	
	if inventory.has("corn"):
		corn_label.text = str(inventory["corn"])
	
	if inventory.has("tomato"):
		tomato_label.text = str(inventory["tomato"])
	
	if inventory.has("potato"):
		potato_label.text = str(inventory["potato"])
	
	if inventory.has("carrot"):
		carrot_label.text = str(inventory["carrot"])
	
	if inventory.has("onion"):
		onion_label.text = str(inventory["onion"])
		
	if inventory.has("radish"):
		radish_label.text = str(inventory["radish"])
		
	if inventory.has("spinach"):
		spinach_label.text = str(inventory["spinach"])
		
	if inventory.has("turnip"):
		turnip_label.text = str(inventory["turnip"])
		
	if inventory.has("egg"):
		egg_label.text = str(inventory["egg"])
		
	if inventory.has("milk"):
		milk_label.text = str(inventory["milk"])
