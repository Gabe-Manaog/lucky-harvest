class_name Player
extends CharacterBody2D

@onready var hit_component: HitComponent = $HitComponent
@onready var inventory_panel: PanelContainer = $InventoryPanel
@onready var energy_bar: ProgressBar = $EnergyBar
@onready var tool_panel: PanelContainer = $tool_panel


@export var current_tool: DataTypes.Tools = DataTypes.Tools.None

var player_direction: Vector2
var previous_tool: DataTypes.Tools = DataTypes.Tools.None
var hovering_tool_panel: bool = false
var tool_selected: bool = false  # Track if a tool was selected
var suppress_animation: bool = false  # Prevents animation on tool selection

func _ready() -> void:
	ToolManager.tool_selected.connect(on_tool_selected)

	
func on_tool_selected(tool: DataTypes.Tools) -> void:
	current_tool = tool
	hit_component.current_tool = tool
	tool_selected = true  # Mark that a tool was actively chosen
	suppress_animation = true  # Prevent animation on this tool switch
