extends VBoxContainer

@onready var label : Label = $Label
@onready var star_array : Array[Sprite2D] = [
	$HBoxContainer/LevelComplete/Sprite2D,
	$HBoxContainer/LevelDrawLimit/Sprite2D,
	$HBoxContainer/LevelEraseLimit/Sprite2D,
	$HBoxContainer/LevelEraseAll/Sprite2D,
	$HBoxContainer/LevelSecretFound/Sprite2D]

@export var labelID : Vector2

func _ready() -> void:
	label.text += str(int(labelID[1]) +1)
	
	star_array[0].visible = Global.level_done[labelID[0]][labelID[1]]
	star_array[1].visible = Global.level_done_draw_limit[labelID[0]][labelID[1]]
	star_array[2].visible = Global.level_done_erase_limit[labelID[0]][labelID[1]]
	star_array[3].visible = Global.level_done_erase_all[labelID[0]][labelID[1]]
	star_array[4].visible = Global.level_done_secret[labelID[0]][labelID[1]]
