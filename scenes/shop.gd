extends CanvasLayer

@onready var currency_label: Label = $Panel/Control/CurrencyPanel/MarginContainer/CurrencyLabel
var currency = 0
var current_page = 0
var inventory = InventoryManager.inventory
var crops_dict = {
	0:{"name":"Corn",
"description": "Long Yellow Snack",
"cost": 500
},
	1:{"name":"Tomato",
"description": "Delectable Red Treat",
"cost": 500
},
	2:{"name":"Potato",
"description": "Potatoe potahto",
"cost": 700
},
	3:{"name":"Stone",
"description": "Stone Cold ",
"cost": 1000
},
	4:{"name":"Wood",
"description": "Chuck Chuck Wood",
"cost": 1000
}
}
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since thce previous frame.
func _process(delta: float) -> void:
	pass


func _on_close_pressed() -> void:
	get_node('Panel/Anim').play('TransOut')
	get_tree().paused = false

func switchItem(select):
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
				currency_label.text = "Currency " + str(currency)


func _on_sell_pressed() -> void:
	for i in range(crops_dict.size()):
		if i == current_page:
			if currency >= crops_dict[current_page]["cost"]:
				currency += crops_dict[current_page]["cost"]
				currency_label.text = "Currency " + str(currency)
