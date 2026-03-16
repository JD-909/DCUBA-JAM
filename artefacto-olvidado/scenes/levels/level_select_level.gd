extends Level

@export var world : int 

@onready var player_position_array : Array[Vector2] = [
	$PermanentDrawnBodies/ExitDoor.position,
	$PermanentDrawnBodies/DoorLevel1.position,
	$PermanentDrawnBodies/DoorLevel2.position,
	$PermanentDrawnBodies/DoorLevel3.position,
	$PermanentDrawnBodies/DoorLevel4.position,
	$PermanentDrawnBodies/DoorLevel5.position
]

func _ready() -> void:
	$AudioStreamPlayer2D.play()
	# world -1 *5 es para que los niveles mas altos den un numero entre 0 y 5 
	$Drawer.position = player_position_array[Global.last_level_visited - ((world -1) * 5)]
	Global.visit(level_ID)
