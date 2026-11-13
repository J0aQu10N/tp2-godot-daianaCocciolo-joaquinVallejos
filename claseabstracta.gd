class_name ClaseAbstracta
extends Area2D



func _ready() -> void:
	
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	# Polimorfismo
	if body.name == "CharacterBody2D":
		_reaccionar_interaccion(body)

## Método abstracto. 
func _reaccionar_interaccion(_jugador: Node2D) -> void:
	pass
