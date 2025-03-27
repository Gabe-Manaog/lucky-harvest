extends CanvasLayer

@onready var currency_label: Label = $Panel/Control/CurrencyPanel/MarginContainer/CurrencyLabel
var currency = 0
var inventory = InventoryManager.inventory
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_close_pressed() -> void:
	get_node('Panel/Anim').play('TransOut')
	get_tree().paused = false

func switchItem(select):
	print(InventoryManager.inventory[select])

func _on_next_pressed() -> void:
	print(inventory)

func _on_previous_pressed() -> void:
	pass


func _on_purchase_pressed() -> void:
	InventoryManager.add_collectable("corn")


func _on_sell_pressed() -> void:
	InventoryManager.remove_collectable("corn")
	currency+=500
	currency_label.text = "Currency " + str(currency)
