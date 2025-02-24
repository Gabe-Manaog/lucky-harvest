class_name CollectableComponent
extends Area2D

@export var collectable_name: String
# Called when the node enters the scene tree for the first time.

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		InventoryManager.add_collectable(collectable_name)
		print("Collected")
		get_parent().queue_free()
