extends CharacterBody2D


const MAX_SPEED: float = 1.9
var direction: Vector2
@onready var center: Vector2 = get_viewport().get_camera_2d().get_screen_center_position()
@onready var game_manager: Node = %GameManager

func _ready() -> void:
	spawn()

func _physics_process(delta: float) -> void:
	var collision: KinematicCollision2D = move_and_collide(velocity * delta)

	if collision:
		if (collision.get_collider().name == "Player"):
			pass

		if (collision.get_collider().name.to_lower().begins_with("brick")):
			collision.get_collider().queue_free()
			print(collision.get_collider().name)
			game_manager.update_score()
			
		velocity = velocity.bounce(collision.get_normal())
		print(velocity)
		if (velocity.x < MAX_SPEED && velocity.y < MAX_SPEED):
			velocity.x *= 1.1
			velocity.y *= 1.1

func spawn() -> void:
	position = center
	velocity = Vector2(0, 200)
