class_name  DrawnBody
extends StaticBody2D

const target_color : Color = Color(1.0, 0.588, 0.588, 1.0)
const regular_color : Color = Color(1.0, 1.0, 1.0, 1.0)

@export var is_permanent : bool

func be_drawn() -> void:
	pass

func be_erased() -> void:
	queue_free()

func target() -> void:
	pass
func untarget() -> void:
	pass

func get_permanency() -> bool:
	return is_permanent
