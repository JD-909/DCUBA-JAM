extends Node2D

func restart_level() -> void:
	# Reload the level
	get_tree().call_deferred("reload_current_scene")
