extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_volver_a_jugar_pressed() -> void:
	get_tree().change_scene_to_file('res://world/nivel1.tscn')
	pass # Replace with function body.


func _on_menú_principal_pressed() -> void:
	get_tree().change_scene_to_file('res://world/menu_principal.tscn')
	pass # Replace with function body.
