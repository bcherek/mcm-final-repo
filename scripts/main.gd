extends Node2D

const planet = preload("res://scenes/planet.tscn")
func _ready() -> void:
	var planet_instance = planet.instantiate(PackedScene.GEN_EDIT_STATE_DISABLED)
	planet_instance.position = Vector2(get_viewport().size.x / 2,get_viewport().size.y / 2)
	add_child(planet_instance)
