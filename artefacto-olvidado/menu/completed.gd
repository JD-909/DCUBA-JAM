extends Control

func _on_redo_pressed() -> void:
	pass # Replace with function body.


func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/main_menu_level.tscn")


func _on_levels_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/level_select_level.tscn")
