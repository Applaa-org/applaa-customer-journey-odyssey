extends CharacterBody2D

const SPEED: float = 300.0
const BOOST_SPEED: float = 500.0

@onready var sprite = $Sprite2D

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
	
	var current_speed = SPEED
	if Input.is_action_pressed("ui_accept"):  # Spacebar for boost
		current_speed = BOOST_SPEED
	
	if direction != Vector2.ZERO:
		velocity = direction.normalized() * current_speed
	else:
		velocity = velocity.move_toward(Vector2.ZERO, SPEED * delta)
	
	move_and_slide()
	
	# Keep player in bounds
	position.x = clamp(position.x, 0, 1024)
	position.y = clamp(position.y, 0, 768)