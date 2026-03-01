extends DrawnBody

func _ready() -> void:
	is_permanent = false
	
	if rotation != 0:
		$CollisionShape2D.one_way_collision = false
