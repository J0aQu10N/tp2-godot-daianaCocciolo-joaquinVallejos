class_name CartelVictoria
extends ClaseAbstracta

##Polimorfismo: Va a pantalla de victoria
func reaccionar_interaccion(_jugador: Jugador) -> void:
	get_tree().change_scene_to_file.call_deferred('res://world/pantalla_de_victoria.tscn')
