extends CharacterBody2D


const SPEED = 300.0

func _physics_process(delta: float) -> void:
	process_movement()
	move_and_slide()

func process_movement() -> void:
	var direction := Input.get_axis("left", "right")
	
	if direction:
		velocity.x = direction * SPEED
	else:	
		velocity.x = move_toward(velocity.x, 0, SPEED)
