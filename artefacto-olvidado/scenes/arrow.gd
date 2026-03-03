extends CharacterBody2D

const SPEED = 500

@onready var hit_sound : AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var arrow_point = $Area2D/CollisionShape2D

var direction : Vector2 = Vector2(1,0)

func _process(_delta: float) -> void:
	
	velocity = SPEED*direction
	
	if (is_on_ceiling() or is_on_floor() or is_on_wall()) and  not  hit_sound.playing:
		direction = Vector2(0,0)
		arrow_point.disabled = true
		hit_sound.play()
	
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	body.die()


func _on_audio_stream_player_2d_finished() -> void:
	queue_free()
