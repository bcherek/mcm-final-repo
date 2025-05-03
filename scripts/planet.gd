extends Node2D

class_name Planet

var population: Array
var abduct_arr: Array
var planet_name: String
var climate: String
var in_tooltip: bool
var allow_tooltips: bool


signal tooltip_requested
signal tooltip_dismissed
signal abduct_gui
signal planet_data_requested
signal be_destination

@onready var tooltip_main: PanelContainer = $planet_sprite/planet_hitbox/CollisionShape2D/Tooltip_main
@onready var planet_hitbox: Area2D = $planet_sprite/planet_hitbox
@onready var tooltip_hitbox: Area2D = $planet_sprite/planet_hitbox/CollisionShape2D/tooltip_hitbox
@export var planet_ID: int = -1
@onready var planet_sprite: Sprite2D = $planet_sprite


func _ready():
	abduct_arr.resize(26)
	abduct_arr.fill(0)
	planet_sprite.texture = Constants.PLAN_PHOTOS[planet_ID]

#num can be floating point maybe!?
func request_abduct(spec_index: int, abduct_delta) -> bool:
	print("request abduct")
	
	if (population[spec_index] < abduct_arr[spec_index] + abduct_delta):
		#We are trying to abduct for more than we have
		return false
	if (abduct_arr[spec_index] + abduct_delta < 0):
		#can not reduce abduct_arr to negative values
		return false
	
	#Abduct was permitted; update our data
	abduct_arr[spec_index] += abduct_delta
	
	emit_signal("abduct_gui",abduct_arr)
	return true




func set_planet_data(input: Dictionary) -> void:	
	#Called by the signal planet_data_requested
	print("Planet: set_planet_data")
	population = input["pops"]
	planet_name = input["planet_name"]
	climate = input["climate"]
	allow_tooltips = true
	tooltip_main.set_planet_info({"planet_name": planet_name, "population": population, "climate": climate})
	tooltip_main.visible = true
	tooltip_hitbox.visible = true

func _on_area_2d_mouse_entered() -> void:
	emit_signal("tooltip_requested")


func open_tooltip() -> void:
	#should only be called by Planet Manager
	emit_signal("planet_data_requested")
	
func close_tooltip() -> void:
	if (tooltip_main.visible):
			emit_signal("tooltip_dismissed")
			tooltip_main.visible = false
			tooltip_hitbox.visible = false

func empty_abduct_arr() -> void:
	abduct_arr.resize(26)
	abduct_arr.fill(0)


func _on_tooltip_hitbox_mouse_exited() -> void:
	close_tooltip()

func _on_tooltip_hitbox_mouse_entered() -> void:
	pass

func _on_set_dest_pressed() -> void:
	emit_signal("be_destination")
	pass # Replace with function body.
