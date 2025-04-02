extends NodeState

@export var character: NonPlayableCharacter
@export var animated_sprite_2d: AnimatedSprite2D
@export var navigation_agent_2d: NavigationAgent2D
@export var min_speed: float = 5.0
@export var max_speed: float = 10.0
@export var egg_lay_interval: float = 5.0 
const egg_scene = preload("res://scenes/crops/egg.tscn")

var speed: float
var lay_egg_timer: float

func _ready() -> void:
	navigation_agent_2d.velocity_computed.connect(on_safe_velocity_computed)
	
	call_deferred("character_setup")
	lay_egg_timer = randf_range(egg_lay_interval, egg_lay_interval * 2)

func character_setup() -> void:
	await get_tree().physics_frame
	
	set_movement_target()

func set_movement_target() -> void:
	var target_position: Vector2 = NavigationServer2D.map_get_random_point(navigation_agent_2d.get_navigation_map(), navigation_agent_2d.navigation_layers, false)
	navigation_agent_2d.target_position = target_position
	speed = randf_range(min_speed, max_speed)

func lay_egg() -> void:
	if egg_scene:
		var egg_instance = egg_scene.instantiate()
		get_parent().add_child(egg_instance)
		egg_instance.global_position = character.global_position 

func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	if navigation_agent_2d.is_navigation_finished():
		character.current_walk_cycle += 1
		set_movement_target()
		return
	
	var target_position: Vector2 = navigation_agent_2d.get_next_path_position()
	var target_direction: Vector2 = character.global_position.direction_to(target_position)
	
	var velocity: Vector2 = target_direction * speed
	
	if navigation_agent_2d.avoidance_enabled:
		animated_sprite_2d.flip_h = velocity.x < 0
		navigation_agent_2d.velocity = velocity
	else:
		character.velocity = velocity
		character.move_and_slide()
	# Handle egg laying logic
	lay_egg_timer -= _delta
	if lay_egg_timer <= 0:
		lay_egg()
		lay_egg_timer = randf_range(egg_lay_interval, egg_lay_interval * 2)

func on_safe_velocity_computed(safe_velocity: Vector2) -> void:
	animated_sprite_2d.flip_h = safe_velocity.x < 0
	character.velocity = safe_velocity
	character.move_and_slide()

func _on_next_transitions() -> void:
	if character.current_walk_cycle == character.walk_cycles:
		character.velocity = Vector2.ZERO
		transition.emit("Idle")


func _on_enter() -> void:
	animated_sprite_2d.play("walk")
	character.current_walk_cycle = 0


func _on_exit() -> void:
	animated_sprite_2d.stop()
