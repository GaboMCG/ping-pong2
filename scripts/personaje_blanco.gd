extends CharacterBody2D

var velocidad_impulso = 50
@onready var animation_player1 = $AnimatedSprite2D


func _ready() -> void: 
	animation_player1.play("idle")

func _physics_process(delta: float) -> void:
	
	velocity.x = 0
	position.x = 21
	
	if (Input.is_action_pressed("arriba_p1")):
		velocity.y -= velocidad_impulso
		
	elif (Input.is_action_pressed("abajo_p1")):
		velocity.y += velocidad_impulso
		
	else:
		velocity.y = 0
	
	
	move_and_slide()

func _on_area_2d_body_entered(body: Node2D) -> void:
		if body.is_in_group("Pelota"):
			animation_player1.play("golpeo")
			$Golpe_Timer.start()


func _on_golpe_timer_timeout() -> void:
	animation_player1.play("idle")
