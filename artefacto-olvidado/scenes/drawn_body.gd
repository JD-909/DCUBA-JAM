class_name  DrawnBody
extends StaticBody2D

const target_color : Color = Color(1.0, 0.588, 0.588, 1.0)
const regular_color : Color = Color(1.0, 1.0, 1.0, 1.0)

var is_permanent : bool

func be_drawn() -> void:
	pass

func be_erased() -> void:
	if not is_permanent:
		queue_free()

func target() -> void:
	if not is_permanent:
		$Sprite2D.modulate = target_color

func untarget() -> void:
	if not is_permanent:
		$Sprite2D.modulate = regular_color

func get_permanency() -> bool:
	return is_permanent
