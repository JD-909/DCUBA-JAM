class_name DrawnDoor
extends PermanentDrawnBody

@onready var use_area_collision = $UseArea/CollisionShape2D

@export var take_me_to : StringName = "res://scenes/levels/main_menu_level.tscn"

func when_drawn() -> void:
	use_area_collision.disabled = false

func when_erased() -> void:
	use_area_collision.disabled = true

func use_door() -> void:
	$ExitDoorSound.play()

func _on_use_area_body_entered(body: Node2D) -> void:
	body.change_door($".")

func _on_use_area_body_exited(body: Node2D) -> void:
	if active_sprite > 0:
		body.change_door(null)

func _on_exit_door_sound_finished() -> void:
	get_tree().change_scene_to_file(take_me_to)
