extends AudioStreamPlayer2D

@onready var theme_song = $"."

func _ready():
	pass


func _process(delta):
	if not theme_song.playing:
		theme_song.play()
	pass
