extends CharacterBody2D

const SPEED = 300
const JUMP_FORCE = -500

var direction : float
var line_placement_position : Vector2

@onready var drawer_sprite = $DrawerSprite
@onready var pencil_sprite = $PencilSprite
@onready var line_placement_sprite = $LinePlacementSprite

func _process(delta: float) -> void:
	
	# Gravity
	velocity.y += get_gravity().y*delta
	
	# Jump handler
	if is_on_floor() and Input.is_action_just_pressed("jump_key"):
		velocity.y = JUMP_FORCE
	
	# Move handler
	direction = Input.get_axis("left_key", "right_key")
	velocity.x = direction*SPEED
	
	# Sprite handling
	if Input.is_action_pressed("up_key"):
		line_placement_sprite.position = Vector2(0,-64)
		line_placement_sprite.rotation = 0
		pencil_sprite.flip_v = false
		pencil_sprite.position = Vector2(0,-16)
		pencil_sprite.rotation = 0
	elif drawer_sprite.flip_h:
		line_placement_sprite.position = Vector2(-64,0)
		line_placement_sprite.rotation = PI/2
		pencil_sprite.flip_v = true
		pencil_sprite.position = Vector2(-16,0)
		pencil_sprite.rotation = PI/2
	else:
		line_placement_sprite.position = Vector2(64,0)
		line_placement_sprite.rotation = PI/2
		pencil_sprite.flip_v = false
		pencil_sprite.position = Vector2(16,0)
		pencil_sprite.rotation = PI/2
	
	if direction == -1:
		drawer_sprite.flip_h = true
	elif direction == 1:
		drawer_sprite.flip_h = false
	
	move_and_slide()
