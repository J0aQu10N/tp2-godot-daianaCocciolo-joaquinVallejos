## controlador custom para los que están acostumbrados al esquema de controles modernos de WASD
## o no tengan las flechitas en el teclado (Como es mi caso)
class_name ControladorWASD
extends Controlador
func obtener_direccion() -> float:
		return Input.get_axis("wasd_izq", "wasd_der")

func quiere_saltar() -> bool:
	return Input.is_action_just_pressed("wasd_saltar")
