extends Node2D


func _on_volver_pressed() -> void:
	get_tree().change_scene_to_file("res://scena/Ping.tscn")



func _on_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://scena/menu_de_inicio.tscn")
