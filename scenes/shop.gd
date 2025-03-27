extends CanvasLayer

var currItem='corn'
var select ="corn"
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
