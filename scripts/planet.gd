extends Node2D

class_name Planet

var population: Array
var species_latins: Array[String] #this needs to change when we begin hiding populations
var planet_name: String
var climate: String
var in_tooltip: bool
var allow_tooltips: bool


signal tooltip_requested
signal tooltip_dismissed

signal planet_data_requested

@onready var tooltip_main: PanelContainer = $planet_sprite/planet_hitbox/CollisionShape2D/Tooltip_main
@onready var planet_hitbox: Area2D = $planet_sprite/planet_hitbox
@onready var tooltip_hitbox: Area2D = $planet_sprite/planet_hitbox/CollisionShape2D/tooltip_hitbox
@export var planet_ID: int = -1


func _ready():
	print("ready")

func set_planet_data(input: Dictionary) -> void:	
	population = input["pops"]
	species_latins = input["species_latins"]
	planet_name = input["planet_name"]
	climate = input["climate"]
	allow_tooltips = true

func get_planet_info() -> Dictionary:
	emit_signal("planet_data_requested")
	return {"planet_name": planet_name, "population": population, "climate": climate, "species_latins": species_latins}
		

func _on_area_2d_mouse_entered() -> void:
	print("planet hitbox mouse entered")
	emit_signal("tooltip_requested")

func _on_area_2d_mouse_exited() -> void:
	# exits the hitbox
	print("planet hitbox mouse exited")

func open_tooltip() -> void:
	#should only be called by Planet Manager
	tooltip_main.visible = true
	tooltip_hitbox.visible = true
	tooltip_main.set_planet_info(get_planet_info())
	
func close_tooltip() -> void:
	if (tooltip_main.visible):
			emit_signal("tooltip_dismissed")
			tooltip_main.visible = false
			tooltip_hitbox.visible = false

func _on_tooltip_hitbox_mouse_exited() -> void:
	print("on tooltip hitbox mouse exited")
	close_tooltip()

func _on_tooltip_hitbox_mouse_entered() -> void:
	pass
