extends Area2D

@onready var spawn_point = %"Spawn Point"

func _on_body_entered(body: Node2D) -> void:
	if body.has_method("die"):
		body.die()
