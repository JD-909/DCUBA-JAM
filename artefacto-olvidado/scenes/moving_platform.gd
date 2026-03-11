extends StaticBody2D

const SPEED = 100

enum Axis_Direction {Horizontal, Vertical}

@export var Axis : Axis_Direction = Axis_Direction.Horizontal
@export var tilesToTravel : int = 1

var movementVector : Vector2
var InitialPosition : Vector2
var FinalPosition : Vector2
var dir = 1

func _ready() -> void:
	
	InitialPosition = global_position
	
	match Axis:
		Axis_Direction.Horizontal:
			movementVector = Vector2(SPEED,0)
			FinalPosition = InitialPosition + Vector2(tilesToTravel*64, 0)
		Axis_Direction.Vertical:
			FinalPosition = InitialPosition + Vector2(0, tilesToTravel*64)
			movementVector = Vector2(0,SPEED)
	
	print(InitialPosition)
	print(FinalPosition)

func _process(delta: float) -> void:
	
	if global_position <= InitialPosition:
		dir = 1
	elif global_position >= FinalPosition:
		dir = -1
	
	move_and_collide(movementVector*delta*dir)
