extends Node2D

@onready var player: Player = $"../Player"
@onready var energy_bar: ProgressBar = $EnergyBar

var energy


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	energy_bar.value = 100


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
