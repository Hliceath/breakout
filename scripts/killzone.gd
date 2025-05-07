extends Area2D

@onready var game_manager: Node = %GameManager
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

func _on_body_entered(body: Node2D) -> void:
	game_manager.reset_ball()
	audio_stream_player.play()
