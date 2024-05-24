extends Area2D

@export var Nextlevel : PackedScene


func _on_body_entered(body):
	SceneTransition.transite_from_packed_scene(Nextlevel)
	if(body.has_method("spawn")):
		body.spawn()
