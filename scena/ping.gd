extends Node2D

var puntaje_p1 = 0
var puntaje_p2 = 0



func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Pelota"):
		puntaje_p2 += 1
		$Puntaje2.text = str(puntaje_p2)


func _on_area_2d_2_body_entered(body: Node2D) -> void:
	if body.is_in_group("Pelota"):
		puntaje_p1 += 1
		$Puntaje1.text = str(puntaje_p1)
