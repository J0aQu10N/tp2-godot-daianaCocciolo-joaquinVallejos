extends Area2D

@export var velocidad: float = 400.0
@export var tiempo_vida: float = 4.0
@onready var fuego=$fuegoSFX

var direccion: Vector2 = Vector2.RIGHT
var tiempo: float = 0.0

func set_direccion(dir: Vector2) -> void:
	direccion = dir.normalized()
	rotation = direccion.angle()

func _process(delta: float) -> void:
	position += direccion * velocidad * delta
	tiempo += delta
	if tiempo >= tiempo_vida:
		queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body.name == 'CharacterBody2D':
		get_tree().change_scene_to_file('res://world/pantalla_de_derrota.tscn')
	queue_free()
	

func _ready() -> void:
	fuego.play()	
