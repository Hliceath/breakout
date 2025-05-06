extends Node

var score: int = 0
var high_score: int = 0
var lives: int = 3

@onready var ball: CharacterBody2D = $"../Ball"
@onready var score_label: Label = $"../Control/CanvasLayer/HBoxContainer/ScoreLabel"
@onready var lives_label: Label = $"../Control/CanvasLayer/HBoxContainer/LivesLabel"

func _ready() -> void:
	update_score_ui()
	update_score_lives()

func reset_ball() -> void:
	lives -= 1
	update_score_lives()

	if lives == 0:
		ball.queue_free()
	else:
		ball.spawn()

func update_score() -> void:
	score += 10
	if score > high_score:
		high_score = score
	
	update_score_ui()
	
func update_score_ui() -> void:
	score_label.text = "Score: " + str(score).pad_zeros(8)
	
func update_score_lives() -> void:
	lives_label.text = "Lives x" + str(lives)
