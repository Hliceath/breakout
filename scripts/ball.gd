extends CharacterBody2D


const MAX_SPEED: float = 1.9
@onready var center: Vector2 = get_viewport().get_camera_2d().get_screen_center_position()

func _ready() -> void:
	spawn()

func _physics_process(delta: float) -> void:
	var collision: KinematicCollision2D = move_and_collide(velocity * delta)

	if collision:
		velocity = velocity.bounce(collision.get_normal())
		if (velocity.x < MAX_SPEED && velocity.y < MAX_SPEED):
			velocity.x *= 1.3
			velocity.y *= 1.3

	
	
func spawn() -> void:
	position = center
	velocity = Vector2(0, 200)
