extends Node2D

var potato_harvest_scene = preload("res://scenes/crops/potato_harvest.tscn")

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var watering_particles: GPUParticles2D = $WaterParticles
@onready var flowering_particles: GPUParticles2D = $FloweringParticles
@onready var growth_cycle_component: GrowthCycleComponent = $GrowthCycleComponent
@onready var hurt_component: HurtComponent = $HurtComponent

var growth_state: DataTypes.GrowthStates = DataTypes.GrowthStates.Vegetative
var start_potato_frame_offset: int = 1

func _ready() -> void:
	watering_particles.emitting = false
	flowering_particles.emitting = false
	
	hurt_component.hurt.connect(on_hurt)
	growth_cycle_component.crop_maturity.connect(on_crop_maturity)
	growth_cycle_component.crop_harvesting.connect(on_crop_harvesting)


func _process(delta: float) -> void:
	growth_state = growth_cycle_component.get_current_growth_state()
	sprite_2d.frame = growth_state + start_potato_frame_offset
	
	if growth_state == DataTypes.GrowthStates.Maturity:
		flowering_particles.emitting = true


func on_hurt(hit_damage: int) -> void:
	if !growth_cycle_component.is_watered:
		watering_particles.emitting = true
		growth_cycle_component.is_watered = true


func on_crop_maturity() -> void:
	watering_particles.emitting = false
	flowering_particles.emitting = true


func on_crop_harvesting() -> void:
	var potato_harvest_instance = potato_harvest_scene.instantiate() as Node2D
	potato_harvest_instance.global_position = global_position
	get_parent().add_child(potato_harvest_instance)
	queue_free()
