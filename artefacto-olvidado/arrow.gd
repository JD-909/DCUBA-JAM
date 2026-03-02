extends CharacterBody2D

const SPEED = 500

var direction : Vector2 = Vector2(1,0)

func _process(_delta: float) -> void:
	
	velocity = SPEED*direction
	
	if is_on_ceiling() or is_on_floor() or is_on_wall():
		queue_free()
	
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	body.die()
