## controlador base que usa los los binds de godot para el movimiento con flechitas
class_name ControladorFlechas
extends Controlador
func obtener_direccion() -> float:
	return Input.get_axis("ui_left", "ui_right")

func quiere_saltar() -> bool:
	return Input.is_action_just_pressed("ui_accept")
