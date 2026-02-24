class_name PermanentDrawnBody
extends DrawnBody

var active_sprite : int = 0  # Posicion de la sprite actual
var sprites : Array[Sprite2D]

func _ready() -> void:
	is_permanent = true
	
	for child in $Sprites.get_children():
		sprites.append(child)

func be_drawn() -> void:
	if active_sprite < sprites.size()-1:
		active_sprite += 1
		sprites[active_sprite].visible = true
		sprites[active_sprite].modulate = regular_color

func be_erased() -> void:
	if active_sprite > 0:
		sprites[active_sprite].visible = false
		active_sprite -= 1

func target() -> void:
	if active_sprite < sprites.size()-1:
		sprites[active_sprite+1].visible = true
		sprites[active_sprite+1].modulate = Color8(255,255,255,127)

func untarget() -> void:
	if active_sprite < sprites.size()-1:
		sprites[active_sprite+1].visible = false
