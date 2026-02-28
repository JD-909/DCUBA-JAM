class_name PermanentDrawnBody
extends DrawnBody

var active_sprite : int = 0  # Posicion de la sprite actual
var sprites : Array[Sprite2D]

@onready var use_area_collision = $UseArea/CollisionShape2D

@export var take_me_to : StringName = "res://scenes/levels/main_menu_level.tscn"

func _ready() -> void:
	is_permanent = true
	
	for child in $Sprites.get_children():
		sprites.append(child)

func be_drawn() -> void:
	if active_sprite < sprites.size()-1:
		active_sprite += 1
		sprites[active_sprite].visible = true
		sprites[active_sprite].modulate = regular_color
		use_area_collision.disabled = false

func be_erased() -> void:
	if active_sprite > 0:
		sprites[active_sprite].visible = false
		active_sprite -= 1
		use_area_collision.disabled = true

func target() -> void:
	if active_sprite < sprites.size()-1:
		sprites[active_sprite+1].visible = true
		sprites[active_sprite+1].modulate = Color8(255,255,255,127)

func untarget() -> void:
	if active_sprite < sprites.size()-1:
		sprites[active_sprite+1].visible = false

func use_door() -> void:
	get_tree().change_scene_to_file(take_me_to)

func _on_use_area_body_entered(body: Node2D) -> void:
	body.change_door($".")


func _on_use_area_body_exited(body: Node2D) -> void:
	body.change_door(null)
