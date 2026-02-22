extends CharacterBody2D

const SPEED = 300
const JUMP_FORCE = -500

var direction : float

func _process(delta: float) -> void:
	
	velocity.y += get_gravity().y*delta
	
	if is_on_floor() and Input.is_action_just_pressed("jump_key"):
		velocity.y = JUMP_FORCE
	
	direction = Input.get_axis("left_key", "right_key")
	velocity.x = direction*SPEED
	
	move_and_slide()
