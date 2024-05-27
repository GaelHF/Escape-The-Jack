extends Node2D

@export var speed = 200.0
var current_speed = 0.0

func _physics_process(delta):
	position.y += current_speed * delta


func _on_sprite_body_entered(body):
	if body.has_method("die"):
		body.die()

func fall():
	if not $"Mecha Sound".playing:
		$"Mecha Sound".play()
	current_speed = speed
	await get_tree().create_timer(5).timeout
	queue_free()


func _on_spike_zone_body_entered(body):
	if body is Player:
		fall()
