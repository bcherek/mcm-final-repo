extends Control

var planet_data: Dictionary
var population: int
var planet_name: String
var climate: String

@onready var label1: Label = $MarginContainer/VBoxContainer/Label
@onready var btn1: Button = $MarginContainer/VBoxContainer/Button
@onready var vbox1: VBoxContainer = $MarginContainer/VBoxContainer
@onready var vals_pop_climate: Label = $MarginContainer/VBoxContainer/HBoxContainer/vals_pop_climate

func _ready():
	#without this code, 
	mouse_filter = Control.MOUSE_FILTER_PASS
	
	pass

func set_planet_info(dict: Dictionary) -> void:
	# do something to children nodes with the dictionary
	print("set_planet_info")
	planet_data = dict
	print(dict)
	planet_name = dict["planet_name"]
	population = dict["population"]
	climate = dict["climate"]
	
	populate_labels(dict)
	

func populate_labels(dict) -> void:
	top_label(dict)
	configure_button()
	pop_climate_vals()
	
func pop_climate_vals() -> void:
	vals_pop_climate.text = str(population) + "\n" + climate

func top_label(dict: Dictionary):
	label1.text = "Planet " + planet_name
	
func configure_button():
	
	pass
