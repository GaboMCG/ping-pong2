extends CharacterBody2D

var velocidad_impulso = 30

func _physics_process(delta: float) -> void:
	
	velocity.x = 0
	position.x = 1130
	
	if (Input.is_action_pressed("arriba_p2")):
		velocity.y -= velocidad_impulso
		
	elif (Input.is_action_pressed("abajo_p2")):
		velocity.y += velocidad_impulso
		
	else:
		velocity.y = 0
	
	move_and_slide()
