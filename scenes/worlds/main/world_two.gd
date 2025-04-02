extends Node2D

@onready var player: Player = $Player
@onready var energy_bar: ProgressBar = player.get_node("EnergyBar")
@onready var tool_panel: PanelContainer = player.get_node("tool_panel")
@onready var tool_potato: Button = tool_panel.get_node("MarginContainer/HBoxContainer/Tool_Potato")
@onready var tool_carrot: Button = tool_panel.get_node("MarginContainer/HBoxContainer/Tool_Carrot")
@onready var tool_onion: Button = tool_panel.get_node("MarginContainer/HBoxContainer/Tool_Onion")
@onready var tool_radish: Button = tool_panel.get_node("MarginContainer/HBoxContainer/Tool_Radish")
@onready var tool_spinach: Button = tool_panel.get_node("MarginContainer/HBoxContainer/Tool_Spinach")
@onready var tool_turnip: Button = tool_panel.get_node("MarginContainer/HBoxContainer/Tool_Turnip")



var energy

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().process_frame
	tool_potato.disabled = false
	tool_carrot.disabled = false
	tool_onion.disabled = true
	tool_radish.disabled = true
	tool_spinach.disabled = true
	tool_turnip.disabled = true
	energy_bar._set_energy(EnergyManager.energy)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
