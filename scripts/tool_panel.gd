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

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("release_tool"):
		ToolManager.select_tool(DataTypes.Tools.None)
		tool_axe.release_focus()
		tool_tilling.release_focus()
		tool_water.release_focus()
		tool_plant.release_focus()
		
