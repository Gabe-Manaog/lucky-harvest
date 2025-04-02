extends Node

@onready var currency_label: Label = $DayPanel/MarginContainer/DayLabel
var inventory = { "corn": 0, "tomato": 0, "stone": 0, "log": 0 ,"potato": 0, "onion": 0, "turnip": 0, "radish":0,"spinach":0,"egg":0,"milk":0}
var world_access =0
signal inventory_changed

func add_collectable(collectable_name: String) -> void:
	inventory.get_or_add(collectable_name)
	
	if inventory[collectable_name] == null:
		inventory[collectable_name] = 1
	else:
		inventory[collectable_name] += 1
	
	inventory_changed.emit()


func remove_collectable(collectable_name: String) -> void:
	if inventory[collectable_name] == null:
		inventory[collectable_name] = 0
	else:
		if inventory[collectable_name] > 0:
			inventory[collectable_name] -= 1
	
	inventory_changed.emit()
