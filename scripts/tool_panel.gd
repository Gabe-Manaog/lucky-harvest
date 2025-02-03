extends PanelContainer

@onready var tool_axe: Button = $MarginContainer/HBoxContainer/Tool_Axe
@onready var tool_tilling: Button = $MarginContainer/HBoxContainer/Tool_Tilling
@onready var tool_water: Button = $MarginContainer/HBoxContainer/Tool_Water
@onready var tool_plant: Button = $MarginContainer/HBoxContainer/Tool_Plant

func _on_tool_axe_pressed() -> void:
	ToolManager.select_tool(DataTypes.Tools.AxeWood)


func _on_tool_tilling_pressed() -> void:
	ToolManager.select_tool(DataTypes.Tools.TillGround)


func _on_tool_water_pressed() -> void:
	ToolManager.select_tool(DataTypes.Tools.WaterCrops)


func _on_tool_plant_pressed() -> void:
	ToolManager.select_tool(DataTypes.Tools.PlantCorn)
