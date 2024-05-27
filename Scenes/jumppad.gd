extends Node2D

@export var force = -500.0

func _on_body_entered(body):
	if not $"Mecha Sound".playing:
		$"Mecha Sound".play()
	if body.has_method("jumppad"):
		body.jumppad(force)
