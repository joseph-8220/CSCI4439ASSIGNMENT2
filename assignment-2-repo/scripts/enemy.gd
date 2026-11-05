extends CharacterBody2D

@export var speed = 50
@export var left_edge : int
@export var right_edge : int
var direction = 1

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	velocity.x = direction * speed
	if position.x >= right_edge:
		direction = -1
	elif position.x <= left_edge:
		direction = 1
	move_and_slide()
	
