class_name Player
extends CharacterBody2D

@onready var hit_component: HitComponent = $HitComponent
@onready var inventory_panel: PanelContainer = $InventoryPanel
@onready var energy_bar: ProgressBar = $EnergyBar
@onready var tool_panel: PanelContainer = $tool_panel


@export var current_tool: DataTypes.Tools = DataTypes.Tools.None
var player_direction: Vector2
var energy

func _ready() -> void:
	ToolManager.tool_selected.connect(on_tool_selected)
	energy = 100
	energy_bar.init_energy(energy)
	
func on_tool_selected(tool: DataTypes.Tools) -> void:
	current_tool = tool
	hit_component.current_tool = tool
	
