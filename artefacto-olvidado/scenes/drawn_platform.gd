extends DrawnBody

func _ready() -> void:
	is_permanent = false
	
	if rotation != 0:
		$CollisionShape2D.one_way_collision = false

func target() -> void:
	$Sprite2D.modulate = target_color

func untarget() -> void:
	$Sprite2D.modulate = regular_color
