extends Level

const player_position_array : Array[Vector2] = [
	Vector2(96,864),
	Vector2(480,864),
	Vector2(544,672),
	Vector2(608,416),
	Vector2(544,160)
]

func _ready() -> void:
	$AudioStreamPlayer2D.play()
	$Drawer.position = player_position_array[Global.last_level_visited]
	Global.visit(level_ID)
