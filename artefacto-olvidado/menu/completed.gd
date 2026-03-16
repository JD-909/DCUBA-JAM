extends Control

@onready var checking_level = Global.last_level_visited

func _ready() -> void:
	
	# Text handling
	$VBoxContainer/Label.text += str(checking_level)
	$VBoxContainer/HBoxContainer2/DrawLimitStar/Sprite2D/Label.text += str(Global.drawings) +"/"+ str(Global.draw_limits[checking_level -1])
	$VBoxContainer/HBoxContainer2/EraseLimitStar/Sprite2D/Label.text += str(Global.erasures) +"/"+ str(Global.erase_limits[checking_level-1])
	$VBoxContainer/HBoxContainer2/EraseAllStar/Sprite2D/Label.text += str(Global.current_permanents_amount -1) + " sin borrar)"
	
	# Star color handling
	if not Global.level_done_draw_limit[checking_level-1]:
		$VBoxContainer/HBoxContainer2/DrawLimitStar/Sprite2D.modulate = Color("555555ff")
	if not Global.level_done_erase_limit[checking_level-1]:
		$VBoxContainer/HBoxContainer2/EraseLimitStar/Sprite2D.modulate = Color("555555ff")
	if not Global.level_done_erase_all[checking_level-1]:
		$VBoxContainer/HBoxContainer2/EraseAllStar/Sprite2D.modulate = Color("555555ff")
	if not Global.level_done_secret[checking_level-1]:
		$VBoxContainer/HBoxContainer2/SecretStar/Sprite2D.modulate = Color("555555ff")

func _on_redo_pressed() -> void:
	get_tree().change_scene_to_file(Global.levels_by_ID[checking_level])


func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/main_menu_level.tscn")


func _on_levels_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/level_select_level.tscn")
