extends CharacterBody2D

const SPEED = 200.0
const BOOST_SPEED = 400.0
var current_speed = SPEED

func _physics_process(delta):
	var direction = Vector2.ZERO
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	
	if Input.is_action_pressed("ui_accept"):  # Space for boost
		current_speed = BOOST_SPEED
	else:
		current_speed = SPEED
	
	velocity = direction.normalized() * current_speed
	move_and_slide()
	
	# Keep player in bounds
	position.x = clamp(position.x, 0, 8000)  # Long level
	position.y = clamp(position.y, 0, 600)