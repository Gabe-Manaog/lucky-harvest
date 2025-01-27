extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var speed = 100

func get_input():
	var input_dir = Input.get_vector("walk_left", "walk_right", "walk_up", "walk_down")	
	if Input.is_action_just_pressed("walk_left"):
		animated_sprite_2d.play("side")
		animated_sprite_2d.flip_h = false
	elif Input.is_action_just_pressed("walk_right"):
		animated_sprite_2d.play("side")
		animated_sprite_2d.flip_h = true
	elif Input.is_action_just_pressed("walk_up"):
		animated_sprite_2d.play("up")
	elif Input.is_action_just_pressed("walk_down"):
		animated_sprite_2d.play("down")
		
	velocity = input_dir * speed
	
func _physics_process(delta):
	get_input()	
	if velocity==Vector2(0,0):
		animated_sprite_2d.play("idle")
	else:
		move_and_collide(velocity * delta)
