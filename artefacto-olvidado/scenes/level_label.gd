extends VBoxContainer

@onready var label : Label = $Label
@onready var star_array : Array[CenterContainer] = [
	$HBoxContainer/LevelComplete,
	$HBoxContainer/LevelDrawLimit,
	$HBoxContainer/LevelEraseLimit,
	$HBoxContainer/LevelEraseAll,
	$HBoxContainer/LevelSecretFound]

@export var labelID : int

func _ready() -> void:
	label.text += str(labelID +1)
	
	star_array[0].visible = Global.level_done[labelID]
	star_array[1].visible = Global.level_done_draw_limit[labelID]
	star_array[2].visible = Global.level_done_erase_limit[labelID]
	star_array[3].visible = Global.level_done_erase_all[labelID]
	star_array[4].visible = Global.level_done_secret[labelID]
