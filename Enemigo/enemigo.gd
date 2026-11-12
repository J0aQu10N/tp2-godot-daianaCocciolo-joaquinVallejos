extends CharacterBody2D
@export var objetivo:Node2D
@export var velocidad:float = 200
@export var proyectil_escena: PackedScene
@export var cooldown_disparo: float = 2.0
@onready var sprite=$Sprite2D
@onready var roar=$enemigoSFX
@onready var ded=$muerteSFX

var temporizador_disparo: float = cooldown_disparo
var en_pantalla: bool = false
var gravedad = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(_delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravedad * _delta
	mover_hacia_objetivo()
	move_and_slide()
	temporizador_disparo -= _delta
	if temporizador_disparo <= 0.0 and objetivo and en_pantalla:
		disparar()
		temporizador_disparo = cooldown_disparo

func mover_hacia_objetivo():
	if objetivo and en_pantalla:
		var direccion_x = sign(objetivo.global_position.x - global_position.x)
		velocity.x = direccion_x * velocidad
		sprite.flip_h = direccion_x < 0
	else:
		velocity.x = 0
		
func _on_perder_body_entered(body: Node2D) -> void:
	if body.name == 'CharacterBody2D':
		set_physics_process(false)
		velocity = Vector2.ZERO
		ded.play()
		await ded.finished
		queue_free()
		
func disparar() -> void:
	if not proyectil_escena or not objetivo:
		return
	var proyectil = proyectil_escena.instantiate()
	get_tree().current_scene.add_child(proyectil)
	proyectil.global_position = global_position
	var dir = (objetivo.global_position - global_position).normalized()
	proyectil.set_direccion(dir)
	
func _on_visible_on_screen_notifier_2d_screen_entered() -> void:
	roar.play()
	en_pantalla = true

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	en_pantalla = false
