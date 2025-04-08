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
