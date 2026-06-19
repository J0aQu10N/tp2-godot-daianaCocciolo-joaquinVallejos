extends CharacterBody2D

@export var objetivo:Node2D
@export var velocidad:float = 200
@onready var roar=$enemigoSFX

var gravedad = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(_delta: float) -> void:
	mover_hacia_objetivo()
	move_and_slide()

func mover_hacia_objetivo():
	if objetivo:
		var direccion:Vector2 = (objetivo.global_position - global_position)
		velocity = direccion.normalized() * velocidad

func _on_perder_body_entered(body: Node2D) -> void:
	if body.name == 'CharacterBody2D':
		queue_free()

func _on_visible_on_screen_notifier_2d_screen_entered() -> void:
	roar.play()
