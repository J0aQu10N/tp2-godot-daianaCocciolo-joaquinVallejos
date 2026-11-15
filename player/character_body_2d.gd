class_name Jugador
extends CharacterBody2D

class Controlador:
	func obtener_direccion() -> float:
		return 0.0
	func quiere_saltar() -> bool:
		return false

class ControladorTeclado extends Controlador:
	func obtener_direccion() -> float:
		return Input.get_axis("ui_left", "ui_right")
		
	func quiere_saltar() -> bool:
		return Input.is_action_just_pressed("ui_accept")

const VELOCIDAD = 400.0
const SALTO = -600.0

@onready var _animationPlayer=$AnimationPlayer
@onready var _sprite=$Sprite2D
@onready var _audioSalto=$SaltoSFX

var _controlador: Controlador = ControladorTeclado.new()

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	#salto
	if _controlador.quiere_saltar() and is_on_floor():
		velocity.y = SALTO
		_audioSalto.play()

	#caminar
	var direction: float = _controlador.obtener_direccion()
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
