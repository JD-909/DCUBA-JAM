extends PermanentDrawnBody

@onready var arrow_res : Resource = load("res://scenes/arrow.tscn")
@onready var shoot_sound : AudioStreamPlayer2D = $ShootSound
@onready var arrow_parent = $"../../Spikes"

@export var direction : Vector2 = Vector2(1,0)

func when_drawn() -> void:
	pass

func when_erased() -> void:
	pass

func _on_timer_timeout() -> void:
	shoot()

func shoot() -> void:
	
	shoot_sound.play()
	
	var arrow = arrow_res.instantiate()
	arrow.global_position = global_position
	arrow.direction = direction
	arrow.rotation = rotation
	arrow_parent.add_child(arrow)
