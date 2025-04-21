extends Node2D

class_name Planet

var planet_data: Dictionary
var population: int
var planet_name: String
var climate: String
var in_tooltip: bool

@onready var planet_hitbox: Area2D = $planet_sprite/planet_hitbox
@onready var tooltip_main: PanelContainer = $planet_sprite/planet_hitbox/CollisionShape2D/Tooltip_main
@onready var tooltip_hitbox: Area2D = $planet_sprite/planet_hitbox/CollisionShape2D/tooltip_hitbox



func _ready():
	generate_planet_data()
	print("planet data created")

func generate_planet_data() -> void:
	population = 1000
	planet_name = "A3-skibidi"
	climate = "sunny"

func get_planet_info() -> Dictionary:
	return {"planet_name": planet_name, "population": population, "climate": climate}
		
func do_time_step() -> void:
	population += 100


func _on_area_2d_mouse_entered() -> void:
	print("planet hitbox mouse entered")
	# enters the HITBOX
	open_tooltip()
	pass # Replace with function body.

func _on_area_2d_mouse_exited() -> void:
	# exits the hitbox
	print("planet hitbox mouse exited")
	pass # Replace with function body.

func open_tooltip() -> void:
	tooltip_main.visible = true
	tooltip_hitbox.visible = true
	tooltip_main.set_planet_info(get_planet_info())
	
func close_tooltip() -> void:
	tooltip_main.visible = false
	tooltip_hitbox.visible = false

func _on_tooltip_hitbox_mouse_exited() -> void:
	print("on tooltip hitbox mouse exited")
	close_tooltip()
	pass # Replace with function body.

func _on_tooltip_hitbox_mouse_entered() -> void:
	print("on tooltip hitbox mouse entered")
	pass # Replace with function body.
