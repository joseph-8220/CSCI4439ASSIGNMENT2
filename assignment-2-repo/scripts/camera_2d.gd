extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	global_position.y = 0.0 
	
	"""
	if (global_position.x <= -34):
		global_position.x = -34
		
	if (global_position.x >= 725):
		global_position.x = 725
	*\
	print("camera pos: ", global_position.x)
	"""
