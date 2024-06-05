extends Node

@export var level5 : PackedScene

func _on_back_pressed():
	SceneTransition.transite_from_packed_scene(level5)
