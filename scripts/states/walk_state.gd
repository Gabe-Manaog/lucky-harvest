extends NodeState

@export var player: Player
@export var animated_sprite_2d: AnimatedSprite2D
@export var speed: int = 700 #change back to 200
@onready var hit_component_collision_shape_2d: CollisionShape2D = $"../../HitComponent/HitComponentCollisionShape2D"
var can_move = true
func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	var direction: Vector2 = GameInputEvents.movement_input()
	if can_move==true:
		if direction == Vector2.LEFT:
			animated_sprite_2d.play("walk_left")
			hit_component_collision_shape_2d.position = Vector2(-9,26)
		elif direction == Vector2.RIGHT:
			animated_sprite_2d.play("walk_right")
			hit_component_collision_shape_2d.position = Vector2(15,27)
		elif direction == Vector2.UP:
			animated_sprite_2d.play("walk_back")
			hit_component_collision_shape_2d.position = Vector2(0,1)
		elif direction == Vector2.DOWN:
			animated_sprite_2d.play("walk_front")
			hit_component_collision_shape_2d.position = Vector2(3,28)

			
		if direction != Vector2.ZERO:
			player.player_direction = direction
		
		player.velocity = direction * speed
		player.move_and_slide()

func _on_next_transitions() -> void:
	if !GameInputEvents.is_movement_input():
		transition.emit("Idle")


func _on_enter() -> void:
	pass
func _on_exit() -> void:
	animated_sprite_2d.stop()
