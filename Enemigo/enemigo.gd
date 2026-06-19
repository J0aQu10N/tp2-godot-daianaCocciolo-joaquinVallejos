extends CharacterBody2D

@export var objetivo:Node2D
@export var velocidad:float = 200
@onready var navegador:NavigationAgent2D = $NavigationAgent2D

func _physics_process(delta: float) -> void:
	mover_hacia_objetivo()
	move_and_slide()

func mover_hacia_objetivo():
	if objetivo:
		var direccion:Vector2 = (objetivo.global_position - global_position)
		velocity = direccion.normalized() * velocidad
	pass


func _on_perder_body_entered(body: Node2D) -> void:
	if body.name == 'CharacterBody2D':
		queue_free()
	pass # Replace with function body.
