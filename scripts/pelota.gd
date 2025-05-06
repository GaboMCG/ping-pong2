extends CharacterBody2D

var velocidad = 100.0
var burs_velocidad = 10.0
var tiempo_intervalo = 8
var tiempo = 0

@onready var animation_player = $AnimatedSprite2D

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
	
	position += velocity * delta
	
	var colision = move_and_collide(velocity * delta)
	
	if colision :
		velocity = velocity.bounce(colision.get_normal())
		
	tiempo +=delta
	
	if tiempo >= tiempo_intervalo:
		velocity *= 1.0 + burs_velocidad / 100.0
		
		tiempo = 0
		
		print("velocidad (despues del aumento):", velocity)
		
	update_animation()
		
func update_animation():
	var random_x_direction = 1 if randf() < 0.5 else -1
	var random_y_direction = 1 if randf() < 0.5 else -1
	var velocidad_inicial = 180
	
	if velocity >= Vector2 (150,150) or velocity <= Vector2 (-150,-150):
		animation_player.play("burst")
	else:
		animation_player.play ("idle")
