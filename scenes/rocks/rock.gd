extends Sprite2D

@onready var hurt_component: HurtComponent = $HurtComponent
@onready var damage_conponent: DamageConponent = $DamageConponent

var log_scene = preload("res://scenes/rocks/stone.tscn")
func _ready() -> void:
	hurt_component.hurt.connect(on_hurt)
	damage_conponent.max_damage_reached.connect(on_max_damaged_reached)
	
func on_hurt(hit_damage: int) -> void:
	damage_conponent.apply_damage(hit_damage)

	
func on_max_damaged_reached() -> void:
	call_deferred("add_stone_scene")
	print("max damaged reached")
	queue_free()

func add_stone_scene() -> void:
	var stone_instance = log_scene.instantiate() as Node2D
	stone_instance.global_position = global_position
	get_parent().add_child(stone_instance)
