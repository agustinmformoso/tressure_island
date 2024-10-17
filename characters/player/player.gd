extends CharacterBody2D

const SPEED = 100.0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	var direction_x = Input.get_axis("move_left", "move_right")
	var direction_y = Input.get_axis("move_up", "move_down")
	
	# Handle input for movement on X and Y axis
	var input_vector := Vector2(
		direction_x,
		direction_y
	).normalized()

	# Apply the movement speed
	velocity = input_vector * SPEED
	
	if direction_x == 0:
		animated_sprite.play("idle")
	else:
		animated_sprite.play("walk")
	
	if direction_x > 0:
		animated_sprite.flip_h = false
	elif direction_x < 0:
		animated_sprite.flip_h = true

	# Move the character
	move_and_slide()
