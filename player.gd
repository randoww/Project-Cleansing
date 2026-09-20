extends CharacterBody2D


const SPEED = 150.0

var last_direction: Vector2 = Vector2.RIGHT

func _physics_process(_delta: float) -> void:
	process_movement()
	process_animation()
	move_and_slide()

#--------------------------
#///MOVEMENT & ANIMATION///
#--------------------------

func process_movement() -> void:
	var direction := Input.get_vector("left", "right", "up", "down")
	
	if direction != Vector2.ZERO:
		velocity = direction * SPEED
		last_direction = direction
	else:
		velocity = Vector2.ZERO
func process_animation() -> void:
	if velocity != Vector2.ZERO:
		play_animation("run", last_direction)
	else:
		play_animation("idle", last_direction)
func play_animation(prefix, dir: Vector2) -> void:
	if dir.x != 0:
		$AnimatedSprite2D.flip_h = dir.x < 0
		$AnimatedSprite2D.play(prefix + "_up")
	if dir.y < 0:
		$AnimatedSprite2D.play(prefix + "_up")
	if dir.y > 0:
		$AnimatedSprite2D.play(prefix + "_up")
		
