class_name Level
extends Node2D

func _ready() -> void:
	$AudioStreamPlayer2D.play()

func restart_level() -> void:
	# Reload the level
	get_tree().call_deferred("reload_current_scene")
