extends CharacterBody2D


const SPEED = 400.0
const JUMP_VELOCITY = -600.0

@onready var animationPlayer=$AnimationPlayer
@onready var sprite2D=$Sprite2D
@onready var audioSalto=$SaltoSFX

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	#salto
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		audioSalto.play()

	#caminar
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	animaciones(direction)
	
	if direction ==1:
		sprite2D.flip_h=false
	elif direction ==-1:
		sprite2D.flip_h=true

func animaciones(direction):
	if is_on_floor():
		if direction ==0:
			animationPlayer.play("idle")
		else:
			animationPlayer.play("caminar")
	else:
		if velocity.y<0:
			animationPlayer.play("caer")
		elif velocity.y>0:
			animationPlayer.play("caer")

func caminarSFX():
	$CaminarSFX.play()
