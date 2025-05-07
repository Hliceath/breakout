extends CharacterBody2D


const SPEED = 500.0
@onready var initial_spawn: Vector2 = Vector2(position.x, position.y)

func _physics_process(delta: float) -> void:
	var direction: float = Input.get_axis("move_left", "move_right")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func reset_player_position() -> void:
	position = initial_spawn
