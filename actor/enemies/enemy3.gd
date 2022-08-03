extends Area2D

func _on_enemy3_body_entered(body):
	if body.is_in_group("player"):
		body.game_over()
