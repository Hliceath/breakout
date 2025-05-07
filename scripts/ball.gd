extends CharacterBody2D


const MAX_SPEED: float = 700.0
var direction: Vector2
@onready var center: Vector2 = get_viewport().get_camera_2d().get_screen_center_position()
@onready var game_manager: Node = %GameManager
@onready var timer: Timer = $Timer
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

func _ready() -> void:
	spawn()

func _physics_process(delta: float) -> void:
	var collision: KinematicCollision2D = move_and_collide(velocity * delta)

	if collision:
		if (collision.get_collider().name == "Player"):
			audio_stream_player.pitch_scale = 1.5
			audio_stream_player.play()
		else:
			audio_stream_player.pitch_scale = 1.0
			audio_stream_player.play()
			
		if (collision.get_collider().name.to_lower().begins_with("brick")):
			collision.get_collider().queue_free()
			game_manager.update_score()

		velocity = velocity.bounce(collision.get_normal())
		if velocity.length() < MAX_SPEED:
			velocity *= 1.03

func spawn() -> void:
	position = center
	velocity = Vector2(0, 0)
	timer.start()

func _on_timer_timeout() -> void:
	velocity = Vector2(0, 200)
