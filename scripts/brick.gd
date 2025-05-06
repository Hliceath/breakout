extends StaticBody2D

@export_enum("Blue", "Green", "Yellow", "Red") var brick_color: String = "Blue"

func _ready() -> void:
	setBrickColor(brick_color)

func setBrickColor(color: String) -> void:
	match color:
		"Blue":
			$Blue.visible = true
		"Green":
			$Green.visible = true
		"Yellow":
			$Yellow.visible = true
		"Red":
			$Red.visible = true
