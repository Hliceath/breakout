extends Node

var score: int = 0
var lives: int = 3
var score_multiplier: int = 1

@onready var ball: CharacterBody2D = $"../Ball"
@onready var player: CharacterBody2D = $"../Player"
@onready var lives_label: Label = $"../Control/CanvasLayer/LivesContainer/LivesLabel"
@onready var score_label: Label = $"../Control/CanvasLayer/ScoreContainer/ScoreLabel"
@onready var try_again_button: Button = $"../Control/CanvasLayer/GameOverMenu/TryAgainButton"

func _ready() -> void:
	update_score_ui()
	update_score_lives()

func reset_ball() -> void:
	lives -= 1
	update_score_lives()

	if lives == 0:
		ball.queue_free()
		try_again_button.visible = true
	else:
		player.reset_player_position()
		ball.spawn()

func update_score() -> void:
	score += 10 * score_multiplier
	update_score_ui()
	
func update_score_ui() -> void:
	score_label.text = "Score: " + str(score).pad_zeros(8)
	
func update_score_lives() -> void:
	lives_label.text = "Lives x" + str(lives)

func _on_try_again_button_pressed() -> void:
	get_tree().reload_current_scene()
