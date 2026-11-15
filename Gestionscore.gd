extends Node

var _puntos_acumulados: int = 0;


##Suma los puntos
func sumar_puntos(puntos: int):
	_puntos_acumulados += puntos

##Reinicia el puntaje
func reiniciar_score():
	_puntos_acumulados = 0

##Getter: Leer el puntaje
func get_puntos() -> int:
	return _puntos_acumulados
