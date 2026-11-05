extends Label

func _ready():
	var player = get_parent().get_parent()
	# If the script is attached to a parent node, reference the label using $
func _process(delta):
	var player = get_parent().get_parent()
	if player.gameOver == false:
		text = str("Score: ", player.score, " Lives: ", player.lives)
	else:
		if player.win == false:
			text = str("GAME OVER! Final Score is ", player.score)
		else:
			text = str("YOU WIN! Final Score is ", player.score)
