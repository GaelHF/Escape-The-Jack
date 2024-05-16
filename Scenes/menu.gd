extends Node

@export var LevelScene : PackedScene

func _on_play_pressed():
	get_tree().change_scene_to_packed(LevelScene)


func _on_credits_pressed():
	get_tree().change_scene_to_file("res://Scenes/credits.tscn")


func _on_quit_pressed():
	get_tree().quit()
