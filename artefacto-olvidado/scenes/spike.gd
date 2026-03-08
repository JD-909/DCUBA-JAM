extends DrawnBody

@export var is_pen_drawn : bool = false

func _ready() -> void:
	if is_pen_drawn:
		is_permanent = true
		$Sprite2D.modulate = Color8(183,183,255)
		$CollisionPolygon2D.disabled = true
	else:
		is_permanent = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	body.die()
