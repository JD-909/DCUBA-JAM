extends DrawnBody

func _ready() -> void:
	is_permanent = false
	
	if rotation != 0:
		$CollisionShape2D.one_way_collision = false

func be_drawn() -> void:
	pass

func be_erased() -> void:
	queue_free()
