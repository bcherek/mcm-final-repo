extends Control

signal confirm_abduct
var known_species: Array[bool] = [true, true, false]

var current_spec_ID = 0
const NUM_SPEC = 3

@onready var species_display_panel: PanelContainer = $VBoxContainer/bottom_pane/VBoxContainer2/species_display_panel
@onready var species_common_name: Label = $"VBoxContainer/bottom_pane/VBoxContainer2/species_display_panel/HBoxContainer/species info/VBoxContainer/Species Common Name"
@onready var species_latin_name: Label = $"VBoxContainer/bottom_pane/VBoxContainer2/species_display_panel/HBoxContainer/species info/VBoxContainer/species latin name"
@onready var species_flavortext: Label = $"VBoxContainer/bottom_pane/VBoxContainer2/species_display_panel/HBoxContainer/species info/VBoxContainer/species flavortext"
@onready var species_photo: TextureRect = $"VBoxContainer/bottom_pane/VBoxContainer2/species_display_panel/HBoxContainer/species info/VBoxContainer/MarginContainer/species photo"


@onready var cargo_bay_label: Label = $VBoxContainer/cargo_bay_label

var curr_time_cosmetic = 0
var curr_src_planet = null
var curr_abduct_arr = [-1]


func populate_abduct_display(abduct_pops: Array, planet: Planet) -> void:
	print("populate display")
	var my_str = "From " + planet.planet_name + ": \n"
	
	
	
	for i in range(len(abduct_pops)):
		if (abduct_pops[i] != 0):
			my_str += str(Constants.SPEC_LATINS[i]) + ": " + str(abduct_pops[i]) + "\n"
	
	set_src_picture(planet.planet_ID)
	
	cargo_bay_label.text = my_str
	
	curr_src_planet = planet
	curr_abduct_arr = abduct_pops

func empty_abduct_display():
	cargo_bay_label.text = "Nothing in Cargo"
	curr_src_planet = null
	curr_abduct_arr = [-1]
	
	
@onready var time_label: Label = $VBoxContainer/time_label
func increase_year():
	curr_time_cosmetic += 1
	time_label.text = "Year " + str(29000 + curr_time_cosmetic)

func _ready() -> void:
	species_display_panel.visible = false

#button pressed to show the menu
func _on_open_menu_pressed() -> void:
	species_display_panel.visible = !species_display_panel.visible
	if (species_display_panel.visible):
		populate_gui(current_spec_ID)

func populate_gui(speciesID: int):
	current_spec_ID = speciesID
	if (known_species[current_spec_ID]):
		## The player knows about the given species. Populate the gui accordingly.
		species_photo.texture = Constants.SPEC_PHOTOS[current_spec_ID]
		species_common_name.text = Constants.SPEC_NAMES[current_spec_ID]
		species_latin_name.text = Constants.SPEC_LATINS[current_spec_ID]
		species_flavortext.text = Constants.SPEC_FLAVORTEXTS[current_spec_ID]
	else:
		##the player DOES NOT know about the species. Leave the gui empty/mysterious
		species_photo.texture = Constants.UNKNOWN_SPEC
		species_common_name.text = "Unknown Species"
		species_latin_name.text = "???"
		species_flavortext.text = "This species may be extinct, or simply unknown. Discover more planets!"

@onready var src_planet: TextureRect = $VBoxContainer/bottom_pane/next_day_menu/VBoxContainer/HBoxContainer/src_planet
@onready var dest_planet: TextureRect = $VBoxContainer/bottom_pane/next_day_menu/VBoxContainer/HBoxContainer/dest_planet

func set_src_picture(planet_id: int) -> void:
	if (planet_id == -1):
		src_planet.texture = Constants.UNKNOWN_PLANET
	else:
		src_planet.texture = Constants.PLAN_PHOTOS[planet_id] 

func set_dest_picture(planet_id: int) -> void:
	if (planet_id == -1):
		dest_planet.texture = Constants.UNKNOWN_PLANET
	else:
		dest_planet.texture = Constants.PLAN_PHOTOS[planet_id] 


#button pressed to go to left species
func _on_left_button_pressed() -> void:
	populate_gui(((current_spec_ID - 1) % NUM_SPEC))

func _on_right_button_pressed() -> void:
	populate_gui(((current_spec_ID + 1) % NUM_SPEC))


func _on_confirm_button_pressed() -> void:
	#Tells PLANET MANAGER that we want to confirm abduct
	if (curr_src_planet != null):
		emit_signal("confirm_abduct",curr_src_planet,curr_abduct_arr)
	else:
		emit_signal("confirm_abduct",null,curr_abduct_arr)
