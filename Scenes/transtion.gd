extends CanvasLayer


func _ready():
	$AnimationPlayer.play("RESET")

func transite_from_file(targetscene) -> void:
		$AnimationPlayer.play("dissolve")
		get_tree().change_scene_to_file(targetscene)
		$AnimationPlayer.play_backwards("dissolve")

func transite_from_packed_scene(targetscene : PackedScene) -> void:
	$AnimationPlayer.play("dissolve")
	get_tree().change_scene_to_packed(targetscene)
	$AnimationPlayer.play_backwards("dissolve")
