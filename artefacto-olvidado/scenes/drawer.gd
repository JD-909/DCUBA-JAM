extends CharacterBody2D

const SPEED = 300
const JUMP_FORCE = -500

var direction : float
var line_placement_offset = 59

@onready var drawer_sprite = $DrawerSprite
@onready var pencil_sprite = $PencilSprite
@onready var line_placement_sprite = $LinePlacementSprite
@onready var drawn_line = load("res://scenes/drawn_platform.tscn")
@onready var lines_node = $"../DrawnLines"

func _process(delta: float) -> void:
	
	# Gravity
	velocity.y += get_gravity().y*delta
	
	# Jump handler
	if is_on_floor():
		
		line_placement_sprite.visible = true
		
		if Input.is_action_just_pressed("jump_key"):
			if Input.is_action_pressed("down_key"):
				position.y += 1
			else:
				velocity.y = JUMP_FORCE
		if Input.is_action_just_pressed("pencil_key"):
			draw()
	else:
		
		line_placement_sprite.visible = false
	
	# Move handler
	direction = Input.get_axis("left_key", "right_key")
	velocity.x = direction*SPEED
	
	# Sprite handling
	if Input.is_action_pressed("up_key"):
		line_placement_sprite.position = Vector2(0,-line_placement_offset)
		line_placement_sprite.rotation = 0
		pencil_sprite.flip_v = false
		pencil_sprite.position = Vector2(0,-16)
		pencil_sprite.rotation = 0
	elif drawer_sprite.flip_h:
		line_placement_sprite.position = Vector2(-line_placement_offset,0)
		line_placement_sprite.rotation = PI/2
		pencil_sprite.flip_v = true
		pencil_sprite.position = Vector2(-16,0)
		pencil_sprite.rotation = PI/2
	else:
		line_placement_sprite.position = Vector2(line_placement_offset,0)
		line_placement_sprite.rotation = PI/2
		pencil_sprite.flip_v = false
		pencil_sprite.position = Vector2(16,0)
		pencil_sprite.rotation = PI/2
	
	if direction == -1:
		drawer_sprite.flip_h = true
	elif direction == 1:
		drawer_sprite.flip_h = false
	
	move_and_slide()

func draw() -> void:
	var drawn_line_instance = drawn_line.instantiate()
	drawn_line_instance.global_position = line_placement_sprite.global_position
	drawn_line_instance.rotation = line_placement_sprite.rotation
	lines_node.add_child(drawn_line_instance)
