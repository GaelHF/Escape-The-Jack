extends Area2D


func _on_body_entered(body):
	if body is Player:
		if not $"Mecha Sound".playing:
			$"Mecha Sound".play()
		queue_free()
