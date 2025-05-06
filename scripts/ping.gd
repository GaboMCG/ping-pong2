extends Node2D

var puntaje_p1 = 0
var puntaje_p2 = 0



func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Pelota"):
		puntaje_p2 += 1
		$Puntaje2.text = str(puntaje_p2)
		reset()

func _on_area_2d_2_body_entered(body: Node2D) -> void:
	if body.is_in_group("Pelota"):
		puntaje_p1 += 1
		$Puntaje1.text = str(puntaje_p1)
		reset()

func reset():
	var random_x_direction = 1 if randf() < 0.5 else -1
	var random_y_direction = 1 if randf() < 0.5 else -1
	var velocidad_inicial = 120
	
	$Pelota.position = Vector2 (576,320)
	$Pelota.velocity = Vector2(velocidad_inicial*random_x_direction,velocidad_inicial*random_y_direction)


func _on_timer_timeout() -> void:
	if puntaje_p1 > puntaje_p2 and puntaje_p1 >= 5:
		get_tree().change_scene_to_file("res://scena/Ganador1.tscn")
	
	elif  puntaje_p2 > puntaje_p1 and puntaje_p2 >= 5:
		get_tree().change_scene_to_file("res://scena/Ganador2.tscn")
		
