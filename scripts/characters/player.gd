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

			
func _process(delta: float) -> void:
	if tool_panel.get_global_rect().has_point(get_global_mouse_position()):
		if not hovering_tool_panel:
			hovering_tool_panel = true
			previous_tool = current_tool  # Save the current tool before setting to None
			current_tool = DataTypes.Tools.None  # Temporarily set to None
			tool_selected = false  # Reset flag when first entering panel
	else:
		if hovering_tool_panel:
			hovering_tool_panel = false
			if not tool_selected:
				current_tool = previous_tool  # Restore previous tool if no selection happened
				
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		if tool_panel.get_global_rect().has_point(get_global_mouse_position()):
			get_viewport().set_input_as_handled()  # Prevents action triggering
		else:
			suppress_animation = false  # Allow animation on normal clicks
