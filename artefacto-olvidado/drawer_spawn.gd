extends Node2D

func _ready() -> void:
	var character_instance = Global.current_character.instantiate()
	character_instance.global_position = global_position
	get_parent().add_child.call_deferred(character_instance)
