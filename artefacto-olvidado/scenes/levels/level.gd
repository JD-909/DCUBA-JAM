class_name Level
extends Node2D

@export var level_ID : int = 0

func _ready() -> void:
	$AudioStreamPlayer2D.play()
	Global.visit(level_ID)

func restart_level() -> void:
	# Reload the level
	get_tree().call_deferred("reload_current_scene")
