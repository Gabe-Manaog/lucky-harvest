extends CanvasLayer

@onready var currency_label: Label = $Panel/Control/CurrencyPanel/MarginContainer/CurrencyLabel
var currency = 1000000
var current_page = 0
var inventory = InventoryManager.inventory
var size =4
var crops_dict = {
	0:{"name":"Corn",
"description": "Long Yellow Snack",
"cost": 500
},
	1:{"name":"Tomato",
"description": "Delectable Red Treat",
"cost": 500
},
	2:{"name":"Stone",
"description": "Stone Cold ",
"cost": 1000
},
	3:{"name":"Log",
"description": "Chuck Chuck Wood",
"cost": 1000
}
}
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	currency_label.text = "Currency " + str(currency)
	get_node("Panel/Control/Icon/AnimatedSprite2D").play(crops_dict[current_page]["name"])
	get_node("Panel/Control/Name").text=(crops_dict[current_page]["name"])
	get_node("Panel/Control/Description").text=(crops_dict[current_page]["description"])
	get_node("Panel/Control/Description").text+=("\n Cost: "+ str(crops_dict[current_page]["cost"]))

# Called every frame. 'delta' is the elapsed time since thce previous frame.
func _process(delta: float) -> void:
	if SceneSwitcher.world_access>=2:
		crops_dict[4]={"name":"Potato","description": "Potatoe potahto","cost": 800}
		crops_dict[5]={"name":"Carrot","description": "Orangelicious","cost": 800}
	if SceneSwitcher.world_access>=3:
		crops_dict[6]={"name":"Onion","description": "Don't Cry","cost": 1000}
		crops_dict[7]={"name":"Radish","description": "This is Rad","cost": 1000}
	if SceneSwitcher.world_access>=4:
		print('lol')
		crops_dict[8]={"name":"Spinach","description": "To get the Big Arms","cost": 1500}
		crops_dict[9]={"name":"Turnip","description": "Tastiest Ever!","cost": 1500}

func _on_close_pressed() -> void:
	get_node('Panel/Anim').play('TransOut')
	get_tree().paused = false

func switchItem(select):
	print(crops_dict)
	for i in range(crops_dict.size()):
		if i == current_page:
			current_page=select
			get_node("Panel/Control/Icon/AnimatedSprite2D").play(crops_dict[current_page]["name"])
			get_node("Panel/Control/Name").text=(crops_dict[current_page]["name"])
			get_node("Panel/Control/Description").text=(crops_dict[current_page]["description"])
			get_node("Panel/Control/Description").text+=("\n Cost: "+ str(crops_dict[current_page]["cost"]))



			
func _on_next_pressed() -> void:
	if current_page<crops_dict.size()-1:
		switchItem(current_page+1)

func _on_previous_pressed() -> void:
	if current_page>0:
		switchItem(current_page-1)



func _on_purchase_pressed() -> void:
	for i in range(crops_dict.size()):
		if i == current_page:
			if currency >= crops_dict[current_page]["cost"]:
				currency -= crops_dict[current_page]["cost"]
				InventoryManager.add_collectable(crops_dict[current_page]["name"].to_lower())
				currency_label.text = "Currency " + str(currency)
				print(inventory)


func _on_sell_pressed() -> void:
	if inventory[crops_dict[current_page]["name"].to_lower()] != null:
		if inventory.get(crops_dict[current_page]["name"].to_lower())>0 :  # Use get() to prevent errors if "cost" is missing
			currency += crops_dict[current_page]["cost"]
			InventoryManager.remove_collectable(crops_dict[current_page]["name"].to_lower())  # Use get() to avoid key errors
			currency_label.text = "Currency " + str(currency)
		
