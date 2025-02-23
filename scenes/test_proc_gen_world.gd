extends Node2D

@onready var noise_generator: NoiseGenerator = $NoiseGenerator
const SMALL_TREE = preload("res://scenes/trees/small_tree.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
