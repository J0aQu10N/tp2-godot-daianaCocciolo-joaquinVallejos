class_name Obstaculo
extends ClaseAbstracta

##Polimorfismo: Va a pantalla de derrota
func reaccionar_interaccion(_jugador: Jugador) -> void:
	
	get_tree().change_scene_to_file.call_deferred("res://world/pantalla_de_derrota.tscn")
