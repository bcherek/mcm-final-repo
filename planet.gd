extends Node2D

var planet_data: Dictionary
var population: int
var planet_name: String
var climate: String

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
