extends StaticBody2D

func _ready() -> void:
	if rotation != 0:
		$CollisionShape2D.one_way_collision = false

func be_erased() -> void:
	queue_free()

func target() -> void:
	$Sprite2D.modulate = Color(1.0, 0.588, 0.588, 1.0)

func untarget() -> void:
	$Sprite2D.modulate = Color(1.0, 1.0, 1.0, 1.0)
