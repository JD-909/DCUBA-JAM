extends Level

@export var world : int 

@onready var player_position_array : Array[Array] = [
	[$PermanentDrawnBodies/ExitDoor.position],
	[$PermanentDrawnBodies/DoorLevel1.position,
	$PermanentDrawnBodies/DoorLevel2.position,
	$PermanentDrawnBodies/DoorLevel3.position,
	$PermanentDrawnBodies/DoorLevel4.position,
	$PermanentDrawnBodies/DoorLevel5.position,
	$PermanentDrawnBodies/ExitDoor.position],
	[$PermanentDrawnBodies/DoorLevel1.position,
	$PermanentDrawnBodies/DoorLevel2.position,
	$PermanentDrawnBodies/DoorLevel3.position,
	$PermanentDrawnBodies/DoorLevel4.position,
	$PermanentDrawnBodies/DoorLevel5.position,
	$PermanentDrawnBodies/ExitDoor.position]
]

func _ready() -> void:
	$AudioStreamPlayer2D.play()
	$Drawer.position = player_position_array[Global.last_level_visited[0]][Global.last_level_visited[1]]
	Global.visit(level_ID)
