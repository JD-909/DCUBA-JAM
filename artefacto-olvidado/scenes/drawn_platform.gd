extends StaticBody2D

func _ready() -> void:
	if rotation != 0:
		$CollisionShape2D.one_way_collision = false
