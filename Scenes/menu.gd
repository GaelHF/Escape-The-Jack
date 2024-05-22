extends Node


@export var LevelScene : PackedScene
@export var CreditScene : PackedScene	
 

func _on_play_pressed():
	SceneTransition.transite_from_packed_scene(LevelScene)



func _on_credits_pressed():
	SceneTransition.transite_from_packed_scene(CreditScene)


func _on_quit_pressed():
	get_tree().quit()
