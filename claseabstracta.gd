class_name ClaseAbstracta
extends Area2D



func _ready() -> void:
	
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	# Polimorfismo
	if body is Jugador:
		reaccionar_interaccion(body)

## Método abstracto. 
func reaccionar_interaccion(_jugador: Jugador) -> void:
	pass
