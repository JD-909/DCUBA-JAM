extends DrawnDoor

@export var ID : int = 0

func _ready() -> void:
	# Si no esta completa la condicion
	if not Global.check_completion(ID):
		use_area_collision.disabled = true
		$Sprites/DrawnSprite1.visible = false
	else:
		$Sprites/DrawnSprite0.visible = false

func _on_exit_door_sound_finished() -> void:
	Global.change_character(ID)
	$"../../Drawer".load_character()
