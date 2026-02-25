extends DrawnBody

func _ready() -> void:
	is_permanent = false

func target() -> void:
	$Sprite2D.modulate = target_color

func untarget() -> void:
	$Sprite2D.modulate = regular_color


func _on_area_2d_body_entered(body: Node2D) -> void:
	body.die()
