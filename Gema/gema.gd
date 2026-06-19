extends Area2D

@onready var scoreSFX=$scoreSFX

func _on_body_entered(body: Node2D) -> void:
	if body.name == 'CharacterBody2D':
		Gestionscore.sumar_puntos(10)
		scoreSFX.play()
		await scoreSFX.finished
		queue_free()
	
