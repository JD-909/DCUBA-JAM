extends CharacterBody2D

const SPEED = 300
const JUMP_FORCE = -500

var direction : float
var line_placement_offset = 60
var draw_erase_target : DrawnBody

@onready var drawer_sprite = $DrawerSprite
@onready var pencil_sprite = $PencilSprite
@onready var line_placement_sprite = $LinePlacementSprite
@onready var drawn_line = load("res://scenes/drawn_platform.tscn")
@onready var lines_node = $"../DrawnLines"
@onready var draw_erase_area = $DrawEraseArea
@onready var draw_erase_area_collision = $DrawEraseArea/CollisionShape2D

func _process(delta: float) -> void:
	
	# Gravity
	velocity.y += get_gravity().y*delta
	
	if is_on_floor():
		
		check_for_permanents()
		
		# Jump and drop
		if Input.is_action_just_pressed("jump_key"):
			if Input.is_action_pressed("down_key"):
				position.y += 1
			else:
				velocity.y = JUMP_FORCE
		
		# Draw and erase
		if Input.is_action_just_pressed("pencil_key"):
			draw()
		if Input.is_action_just_pressed("eraser_key"):
			erase()
	else:
		
		line_placement_sprite.visible = false
	
	# Move handler
	direction = Input.get_axis("left_key", "right_key")
	velocity.x = direction*SPEED
	
	# Sprite and area handling
	if Input.is_action_pressed("up_key"):
		# Line placement indicator
		line_placement_sprite.position = Vector2(0,-line_placement_offset)
		line_placement_sprite.rotation = 0
		# Pencil sprite
		pencil_sprite.flip_v = false
		pencil_sprite.position = Vector2(0,-16)
		pencil_sprite.rotation = 0
		# Draw and erase area
		draw_erase_area.rotation = - PI/2
	elif Input.is_action_pressed("down_key"):
		@warning_ignore("integer_division")
		line_placement_sprite.position = Vector2(0,line_placement_offset/2 + 5)
		line_placement_sprite.rotation = 0
		draw_erase_area.rotation = PI/2
	elif drawer_sprite.flip_h:
		line_placement_sprite.position = Vector2(-line_placement_offset,0)
		line_placement_sprite.rotation = PI/2
		pencil_sprite.flip_v = true
		pencil_sprite.position = Vector2(-16,0)
		pencil_sprite.rotation = PI/2
		draw_erase_area.rotation = PI
	else:
		line_placement_sprite.position = Vector2(line_placement_offset,0)
		line_placement_sprite.rotation = PI/2
		pencil_sprite.flip_v = false
		pencil_sprite.position = Vector2(16,0)
		pencil_sprite.rotation = PI/2
		draw_erase_area.rotation = 0
	
	if direction == -1:
		drawer_sprite.flip_h = true
	elif direction == 1:
		drawer_sprite.flip_h = false
	
	move_and_slide()

func draw() -> void:
	if draw_erase_target != null and draw_erase_target.get_permanency():
		draw_erase_target.be_drawn()
	else:
		var drawn_line_instance = drawn_line.instantiate()
		drawn_line_instance.global_position = line_placement_sprite.global_position
		drawn_line_instance.rotation = line_placement_sprite.rotation
		lines_node.add_child(drawn_line_instance)

func erase() -> void:
	if draw_erase_target != null:                   # Si hay target, aplicale "borrar"
		draw_erase_target.be_erased()
		draw_erase_area_collision.disabled = true   # Pasa a un siguiente target que este en rango
		draw_erase_area_collision.disabled = false

func _on_draw_erase_area_body_entered(body: Node2D) -> void:
	
	if draw_erase_target != null:
		draw_erase_target.untarget()
	
	draw_erase_target = body
	draw_erase_target.target()
	
	check_for_permanents()

func _on_draw_erase_area_body_exited(body: Node2D) -> void:
	if body == draw_erase_target:
		draw_erase_target.untarget()
		draw_erase_target = null


func check_for_permanents() -> void:
	
	if draw_erase_target != null:
		
		if draw_erase_target.get_permanency():
			line_placement_sprite.visible = false
		else:
			line_placement_sprite.visible = true
	else:
		line_placement_sprite.visible = true
		

func die() -> void:
	pass
