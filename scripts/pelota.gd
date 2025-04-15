extends CharacterBody2D

var velocidad = 200
var burs_velocidad = 10
var tiempo_intervalo = 5
var tiempo = 0

func _ready() -> void:
	
	if randi()% 2 == 0:
		velocity.x += velocidad 
		
	else:
		velocity.x -= velocidad

	if randi()% 2 == 0:
		velocity.y += velocidad 
		
	else:
		velocity.y -= velocidad

func _physics_process(delta: float) -> void:
	
	position += velocity* delta
	
	var colision = move_and_collide(velocity * delta)
	
	if colision :
		velocity = velocity.bounce(colision.get_normal())
		
	tiempo +=delta
	
	if tiempo >= tiempo_intervalo:
		velocity *= 1 + burs_velocidad / 100
		
		tiempo = 0
		
#func update_animation():
#	if velocidad >= 400 :
#		animation_player.play("burst")
#	else:
#		animation_player.play ("idle")
