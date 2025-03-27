class_name CropsCursorComponent
extends Node

@export var tilled_soil_tilemap_layer: TileMapLayer

@onready var player: Player = $"../Player"


var corn_plant_scene = preload("res://scenes/crops/corn.tscn")
var tomato_plant_scene = preload("res://scenes/crops/tomato.tscn")
var potato_plant_scene = preload("res://scenes/crops/potato.tscn")
var carrot_plant_scene = preload("res://scenes/crops/carrot.tscn")
var onion_plant_scene = preload("res://scenes/crops/onion.tscn")
var radish_plant_scene = preload("res://scenes/crops/radish.tscn")
var spinach_plant_scene = preload("res://scenes/crops/spinach.tscn")
var turnip_plant_scene = preload("res://scenes/crops/turnip.tscn")

var mouse_position: Vector2
var cell_position: Vector2i
var cell_source_id: int
var local_cell_position : Vector2 
var distance: float 

func _ready() -> void:
	await get_tree().process_frame
	player = get_tree().get_first_node_in_group("player")

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("remove_dirt"):
		if ToolManager.selected_tool == DataTypes.Tools.TillGround:
			get_cell_under_mouse()
			remove_crop()
	elif event.is_action_pressed("hit"):
		if (ToolManager.selected_tool == DataTypes.Tools.PlantCorn or ToolManager.selected_tool == DataTypes.Tools.PlantTomato or 
		ToolManager.selected_tool == DataTypes.Tools.PlantPotato or ToolManager.selected_tool == DataTypes.Tools.PlantCarrot or 
		ToolManager.selected_tool == DataTypes.Tools.PlantOnion or ToolManager.selected_tool == DataTypes.Tools.PlantRadish or
		ToolManager.selected_tool == DataTypes.Tools.PlantSpinach or ToolManager.selected_tool == DataTypes.Tools.PlantTurnip):
			get_cell_under_mouse()
			add_crop()


func get_cell_under_mouse() -> void:
	mouse_position = tilled_soil_tilemap_layer.get_local_mouse_position()
	cell_position = tilled_soil_tilemap_layer.local_to_map(mouse_position)
	cell_source_id = tilled_soil_tilemap_layer.get_cell_source_id(cell_position)
	local_cell_position = tilled_soil_tilemap_layer.map_to_local(cell_position)
	distance = player.global_position.distance_to(local_cell_position)

func add_crop() -> void:
	if distance < 50.0 && cell_source_id != -1:
		var crop_fields = get_parent().find_child("CropFields")
		
		# Check if there's already a crop at the same position
		for child in crop_fields.get_children():
			if child.global_position == local_cell_position:
				return # Prevent planting if a crop already exists
				
		if ToolManager.selected_tool == DataTypes.Tools.PlantCorn:
			var corn_instance = corn_plant_scene.instantiate() as Node2D
			corn_instance.global_position = local_cell_position
			get_parent().find_child("CropFields").add_child(corn_instance)
	
		if ToolManager.selected_tool == DataTypes.Tools.PlantTomato:
			var tomato_instance = tomato_plant_scene.instantiate() as Node2D
			tomato_instance.global_position = local_cell_position
			get_parent().find_child("CropFields").add_child(tomato_instance)

		if ToolManager.selected_tool == DataTypes.Tools.PlantPotato:
			var potato_instance = potato_plant_scene.instantiate() as Node2D
			potato_instance.global_position = local_cell_position
			get_parent().find_child("CropFields").add_child(potato_instance)
			
		if ToolManager.selected_tool == DataTypes.Tools.PlantCarrot:
			var carrot_instance = carrot_plant_scene.instantiate() as Node2D
			carrot_instance.global_position = local_cell_position
			get_parent().find_child("CropFields").add_child(carrot_instance)

		if ToolManager.selected_tool == DataTypes.Tools.PlantOnion:
			var onion_instance = onion_plant_scene.instantiate() as Node2D
			onion_instance.global_position = local_cell_position
			get_parent().find_child("CropFields").add_child(onion_instance)
			
		if ToolManager.selected_tool == DataTypes.Tools.PlantRadish:
			var radish_instance = radish_plant_scene.instantiate() as Node2D
			radish_instance.global_position = local_cell_position
			get_parent().find_child("CropFields").add_child(radish_instance)
			
		if ToolManager.selected_tool == DataTypes.Tools.PlantSpinach:
			var spinach_instance = spinach_plant_scene.instantiate() as Node2D
			spinach_instance.global_position = local_cell_position
			get_parent().find_child("CropFields").add_child(spinach_instance)
			
		if ToolManager.selected_tool == DataTypes.Tools.PlantTurnip:
			var turnip_instance = turnip_plant_scene.instantiate() as Node2D
			turnip_instance.global_position = local_cell_position
			get_parent().find_child("CropFields").add_child(turnip_instance)



func remove_crop() -> void:
	if distance < 50.0:
		var crop_nodes = get_parent().find_child("CropFields").get_children()
		
		for node: Node2D in crop_nodes:
			if node.global_position == local_cell_position:
				node.queue_free()
