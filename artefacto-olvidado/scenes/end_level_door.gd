extends DrawnDoor

func _on_exit_door_sound_finished() -> void:
	Global.complete(Global.last_level_visited)
	get_tree().change_scene_to_file(take_me_to)
