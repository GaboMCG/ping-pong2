extends CharacterBody2D

var velocidad = 150
var burs_velocidad = 2
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
		velocity *= 0.1 + burs_velocidad / 2
		velocidad *= 0.1 + burs_velocidad / 2
		
		tiempo = 0
		
	update_animation()
		
func update_animation():
	if velocidad >= 280:
		animation_player.play("burst")
	else:
		animation_player.play ("idle")
