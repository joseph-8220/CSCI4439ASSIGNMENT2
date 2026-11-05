extends CharacterBody2D

const SPEED = 225.0
const JUMP_VELOCITY = -350.0
@export var score: int
@export var lives: int
@export var gameOver: bool
@export var win: bool
func _ready():
	score = 0
	lives = 3
	gameOver = false
	win = false
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if gameOver == false:
		if Input.is_action_just_pressed("jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY
		if Input.is_action_pressed("left"):
			velocity.x = -SPEED
		if Input.is_action_pressed("right"):
			velocity.x = SPEED
		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		var direction := Input.get_axis("left", "right")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
		
		for index in get_slide_collision_count():
			var collision = get_slide_collision(index)
			var norm = collision.get_normal()
			if collision.get_collider().is_in_group("enemy"):
				if abs(norm.x) > abs(norm.y):
					
					death()
				else:
					
					velocity.y = -250
					score = score + 50
					collision.get_collider().queue_free()
			elif collision.get_collider().is_in_group("coin"):
				
				score = score + 100
				collision.get_collider().queue_free()
	else:
		velocity.x = 0
	if global_position.y >= 160:
		death()
	if global_position.x >= 1641:
		win = true
		gameOver = true
	
	move_and_slide()
	
func death(): 
	if lives > 1:
		lives = lives - 1
		global_position.x= -232
		global_position.y = 56
	else:
		gameOver = true
		global_position.x = 1630
