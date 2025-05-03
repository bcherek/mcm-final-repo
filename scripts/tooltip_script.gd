extends Control

var population: Array
var planet_name: String
var climate: String
var pop_btns: Array[SpeciesModifier]

@onready var planet_label: Label = $"ScrollContainer/MarginContainer/VBoxContainer/planet label"
@onready var climate_label: Label = $ScrollContainer/MarginContainer/VBoxContainer/climate
@onready var pops_header: Label = $"ScrollContainer/MarginContainer/VBoxContainer/pops header"
@onready var v_box_container: VBoxContainer = $ScrollContainer/MarginContainer/VBoxContainer

@onready var planet: Planet = $"../../../.."

const SPECIES_MODIFIER = preload("res://scenes/species_modifier.tscn")

@export var planet_id: int = -1
func _ready():
	mouse_filter = Control.MOUSE_FILTER_PASS
	pop_btns.resize(26)
	pop_btns.fill(null)


func set_planet_info(dict: Dictionary) -> void:
	# do something to children nodes with the dictionary
	print("Tooltip: set_planet_info")
	planet_name = dict["planet_name"]
	population = dict["population"]
	climate = dict["climate"]
	populate_labels()
	
func populate_labels() -> void:
	set_planet_name()
	#destroy_pop_btns()
	create_pop_btns()
	pop_climate_vals()
	
#func destroy_pop_btns() -> void:
	#for i in len(pop_btns):
		#pop_btns[i].free()
	
	
func create_pop_btns() -> void:
	for i in range(len(population)):
		if (pop_btns[i]):
			pop_btns[i].spec_displayed_pop = str(population[i])
			if (population[i] == 0):
				pop_btns[i].visible = false
			pop_btns[i].update_spec_label()
			
		if (population[i] != 0 && !pop_btns[i]):
			var spec_mod: SpeciesModifier = SPECIES_MODIFIER.instantiate()
			pops_header.add_sibling(spec_mod)
			spec_mod.spec_name = Constants.SPEC_LATINS[i]
			spec_mod.spec_id = i
			spec_mod.spec_displayed_pop = str(population[i])
			spec_mod.update_spec_label()
			spec_mod.connect("request",child_requested.bind(spec_mod))
			pop_btns[i] = spec_mod





func child_requested(abduct_delta, spec_mod: SpeciesModifier):
	var spec_id: int = spec_mod.spec_id
	
	
	if (planet.request_abduct(spec_id, abduct_delta)):
		#The abduct was permitted and the back-end was updated
		
		
		#Update the abduct front-end
		if (planet.abduct_arr[spec_id] != 0):
			spec_mod.spec_displayed_pop = str(population[spec_id]) + " (-" + str(planet.abduct_arr[spec_id]) + ")" 
		else:
			spec_mod.spec_displayed_pop = str(population[spec_id])
		spec_mod.update_spec_label()
		

func pop_climate_vals() -> void:
	climate_label.text = "Climate: " + climate

func set_planet_name():
	planet_label.text = "Planet " + planet_name
