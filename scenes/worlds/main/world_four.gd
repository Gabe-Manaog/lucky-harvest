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





# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().process_frame
	tool_potato.disabled = false
	tool_carrot.disabled = false
	tool_onion.disabled = false
	tool_radish.disabled = false
	tool_spinach.disabled = false
	tool_turnip.disabled = false
	energy_bar._set_energy(EnergyManager.energy)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
