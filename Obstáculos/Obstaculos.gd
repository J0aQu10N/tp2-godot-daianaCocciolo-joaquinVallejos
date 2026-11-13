class_name Obstaculo
extends ClaseAbstracta


func _reaccionar_interaccion(_jugador: Node2D) -> void:
	
	get_tree().change_scene_to_file("res://world/pantalla_de_derrota.tscn")
