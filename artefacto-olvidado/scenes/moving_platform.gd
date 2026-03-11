extends CharacterBody2D

const SPEED = 100

enum Axis_Direction {Horizontal, Vertical}

@export var Axis : Axis_Direction = Axis_Direction.Horizontal
@export var tilesToTravel : int = 1

@onready var timer : Timer =$Timer

var movementVector : Vector2
var initialMovementVector : Vector2
var InitialPosition : Vector2
var FinalPosition : Vector2
var dir = 1
var speed = 100

func _ready() -> void:
	
	InitialPosition = global_position
	
	match Axis:
		Axis_Direction.Horizontal:
			initialMovementVector = Vector2(speed,0)
			movementVector = initialMovementVector
			FinalPosition = InitialPosition + Vector2(tilesToTravel*64, 0)
		Axis_Direction.Vertical:
			initialMovementVector = Vector2(0,speed)
			movementVector = initialMovementVector
			FinalPosition = InitialPosition + Vector2(0, tilesToTravel*64)
	
	print(InitialPosition)
	print(FinalPosition)

func _process(_delta: float) -> void:
	
	if global_position <= InitialPosition:
		if dir == -1:
			change_dir()
	elif global_position >= FinalPosition:
		if dir == 1:
			change_dir()
	
	velocity = movementVector*dir
	move_and_slide()

func change_dir() -> void:
	stop_movement()
	timer.start()
	dir = -dir

func _on_timer_timeout() -> void:
	resume_movement()

func stop_movement() -> void:
	movementVector = Vector2.ZERO

func resume_movement() -> void:
	movementVector = initialMovementVector
