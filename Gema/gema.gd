class_name Gema
extends ClaseAbstracta

@export var _valor_puntos: int = 10
@onready var _score_sfx=$scoreSFX

func reaccionar_interaccion(_jugador: Jugador) -> void:
		Gestionscore.sumar_puntos(_valor_puntos)
		_score_sfx.play()
		await _score_sfx.finished
		queue_free()
	
