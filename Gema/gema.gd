class_name Gema
extends ClaseAbstracta

@onready var scoreSFX=$scoreSFX

func _reaccionar_interaccion(_jugador: Node2D) -> void:
		Gestionscore.sumar_puntos(10)
		scoreSFX.play()
		await scoreSFX.finished
		queue_free()
	
