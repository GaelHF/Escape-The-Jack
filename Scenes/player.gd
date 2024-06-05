extends CharacterBody2D
class_name Player

const SPEED = 100.0
const JUMP_VELOCITY = -250.0
const push_force = 80.0

#Nodes
@onready var rect = $"Sprite Sheets"
@onready var spawn_point = %"Spawn Point"

#Sounds Nodes
@onready var jumping_sound = $"Jumping Sound"
@onready var death_sound = $"Death Sound"
@onready var playing_song = true
@onready var theme_song = %"Theme Song"

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	var pos = Vector2(spawn_point.position)
	self.position = pos

func _physics_process(delta):
	if (velocity.x > 1 or velocity.x < -1):
		rect.animation = "Walking"
	else:
		rect.animation = "Idling"
	
	if not is_on_floor():
		velocity.y += gravity * delta
		
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		rect.animation = "Jumping"
		if not jumping_sound.playing:
			jumping_sound.play()
	
	#Reload Scene
	if Input.is_action_just_pressed("Reload"):
		die()
	
	#Main Menu
	if Input.is_action_just_pressed("Menu"):
		get_tree().change_scene_to_file("res://.godot/exported/133200997/export-53a0af8f00fbc899d4d541c34a803049-menu.scn")
	
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 12)
	
	move_and_slide()
	for i in get_slide_collision_count():
		var c = get_slide_collision(i)
		if c.get_collider() is RigidBody2D:
			c.get_collider().apply_central_impulse(-c.get_normal() * push_force)
	var isLeft = velocity.x < 0
	rect.flip_h = isLeft

func egg() -> void:
	SceneTransition.transite_from_file("res://Scenes/easteregg.tscn")

func jumppad(force) -> void:
	self.velocity.y = force

func spawn() -> void:
	var pos = Vector2(spawn_point.position)
	self.position = pos

func die() -> void:
	get_tree().reload_current_scene()
	spawn()
