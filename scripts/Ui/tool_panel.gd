extends PanelContainer

@onready var tool_axe: Button = $MarginContainer/HBoxContainer/Tool_Axe
@onready var tool_tilling: Button = $MarginContainer/HBoxContainer/Tool_Tilling
@onready var tool_water: Button = $MarginContainer/HBoxContainer/Tool_Water
@onready var tool_corn: Button = $MarginContainer/HBoxContainer/Tool_Corn
@onready var tool_tomato: Button = $MarginContainer/HBoxContainer/Tool_Tomato

@onready var tool_potato: Button = $MarginContainer/HBoxContainer/Tool_Potato
@onready var player: Player = $".."
@onready var input_blocker: ColorRect = $InputBlocker




func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("release_tool"):
		ToolManager.select_tool(DataTypes.Tools.None)
		tool_axe.release_focus()
		tool_tilling.release_focus()
		tool_water.release_focus()
		
func _on_tool_axe_pressed() -> void:
	player.current_tool = DataTypes.Tools.None
	ToolManager.select_tool(DataTypes.Tools.AxeWood)

func _on_tool_tilling_pressed() -> void:
	player.current_tool = DataTypes.Tools.None
	ToolManager.select_tool(DataTypes.Tools.TillGround)

func _on_tool_water_pressed() -> void:
	player.current_tool = DataTypes.Tools.None
	ToolManager.select_tool(DataTypes.Tools.WaterCrops)

func _on_tool_corn_pressed() -> void:
	ToolManager.select_tool(DataTypes.Tools.PlantCorn)

func _on_tool_tomato_pressed() -> void:
	ToolManager.select_tool(DataTypes.Tools.PlantTomato)

func _on_tool_potato_pressed() -> void:
	ToolManager.select_tool(DataTypes.Tools.PlantPotato)

func _on_tool_carrot_pressed() -> void:
	ToolManager.select_tool(DataTypes.Tools.PlantCarrot)

func _on_tool_onion_pressed() -> void:
	ToolManager.select_tool(DataTypes.Tools.PlantOnion)
	
func _on_tool_radish_pressed() -> void:
	ToolManager.select_tool(DataTypes.Tools.PlantRadish)

func _on_tool_spinach_pressed() -> void:
	ToolManager.select_tool(DataTypes.Tools.PlantSpinach)
	
func _on_tool_turnip_pressed() -> void:
	ToolManager.select_tool(DataTypes.Tools.PlantTurnip)
