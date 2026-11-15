#Menú pantallas de victoria y derrota.

class_name PantallaFinJuego
extends Control


##Reiniciar score en volver a jugar
func _on_volver_a_jugar_pressed() -> void:
	Gestionscore.reiniciar_score()
	get_tree().change_scene_to_file('res://world/nivel1.tscn')
	pass # Replace with function body.


func _on_menú_principal_pressed() -> void:
	Gestionscore.reiniciar_score()
	get_tree().change_scene_to_file('res://world/menu_principal.tscn')
	pass # Replace with function body.
