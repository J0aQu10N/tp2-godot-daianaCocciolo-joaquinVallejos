## personaje jugable, con movimiento dividido en dos controles para mayor comodidad
class_name Jugador
extends CharacterBody2D

## la base para el controlador
class Controlador:
	func obtener_direccion() -> float:
		return 0.0
	func quiere_saltar() -> bool:
		return false

## controlador base que usa los los binds de godot para el movimiento con flechitas
class ControladorFlechas extends Controlador:
	func obtener_direccion() -> float:
		return Input.get_axis("ui_left", "ui_right")

	func quiere_saltar() -> bool:
		return Input.is_action_just_pressed("ui_accept")

## versión custom para los que están acostumbrados al esquema de controles modernos de WASD
## o no tengan las flechitas en el teclado (Como es mi caso)
class ControladorWASD extends Controlador:
	func obtener_direccion() -> float:
		return Input.get_axis("wasd_izq", "wasd_der")
	
	func quiere_saltar() -> bool:
		return Input.is_action_just_pressed("wasd_saltar")

const VELOCIDAD = 400.0
const SALTO = -600.0

@onready var _animationPlayer=$AnimationPlayer
@onready var _sprite=$Sprite2D
@onready var _audioSalto=$SaltoSFX

var _controladores: Array[Controlador] = [ControladorFlechas.new(), ControladorWASD.new()]

## función que devuelve -1 o 1 según que controlador detecte el input
func _direccion() -> float:
	for controlador in _controladores:
		var direccion: float = controlador.obtener_direccion()
		if direccion != 0.0:
			return direccion
	return 0.0

## función que detecta si alguno de los controladores pidió saltar
func _quiere_saltar() -> bool:
	for controlador in _controladores:
		if controlador.quiere_saltar():
			return true
	return false

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

# salto
	if _quiere_saltar() and is_on_floor():
		velocity.y = SALTO
		_audioSalto.play()

# caminar
	var direction: float = _direccion()
	if direction:
		velocity.x = direction * VELOCIDAD
	else:
		velocity.x = move_toward(velocity.x, 0, VELOCIDAD)

	move_and_slide()
	
	_orientar_sprite(direction)
	_animaciones(direction)

func _orientar_sprite(direction: float) -> void:
	if direction == 1:
		_sprite.flip_h = false
	elif direction == -1:
		_sprite.flip_h = true 

func _animaciones(direction: float) -> void:
	if is_on_floor():
		if direction ==0:
			_animationPlayer.play("idle")
		else:
			_animationPlayer.play("caminar")
	else:
		if velocity.y<0:
			_animationPlayer.play("caer")
		elif velocity.y>0:
			_animationPlayer.play("caer")

func caminarSFX():
	$CaminarSFX.play()
