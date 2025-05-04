extends Control

signal confirm_abduct

var current_spec_ID = 0
const NUM_SPEC = 3

@onready var species_display_panel: PanelContainer = $VBoxContainer/bottom_pane/VBoxContainer2/species_display_panel
@onready var species_common_name: Label = $"VBoxContainer/bottom_pane/VBoxContainer2/species_display_panel/HBoxContainer/species info/VBoxContainer/Species Common Name"
@onready var species_latin_name: Label = $"VBoxContainer/bottom_pane/VBoxContainer2/species_display_panel/HBoxContainer/species info/VBoxContainer/species latin name"
@onready var species_flavortext: Label = $"VBoxContainer/bottom_pane/VBoxContainer2/species_display_panel/HBoxContainer/species info/VBoxContainer/species flavortext"
@onready var species_photo: TextureRect = $"VBoxContainer/bottom_pane/VBoxContainer2/species_display_panel/HBoxContainer/species info/VBoxContainer/MarginContainer/species photo"
@onready var num_universal_pop: Label = $"VBoxContainer/bottom_pane/VBoxContainer2/species_display_panel/HBoxContainer/species info/VBoxContainer/num_universal_pop"


@onready var mass_label: Label = $"VBoxContainer/bottom_pane/VBoxContainer2/species_display_panel/HBoxContainer/species info/VBoxContainer/mass_hbox/Label"
@onready var climate_label: Label = $"VBoxContainer/bottom_pane/VBoxContainer2/species_display_panel/HBoxContainer/species info/VBoxContainer/climate_hbox/Label"


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

@onready var diet_hbox: Control = $"VBoxContainer/bottom_pane/VBoxContainer2/species_display_panel/HBoxContainer/species info/VBoxContainer/diet_hbox"
func populate_gui(speciesID: int):
	current_spec_ID = speciesID
	#if (known_species[current_spec_ID]):
		## The player knows about the given species. Populate the gui accordingly.
	species_photo.texture = Constants.SPEC_PHOTOS[current_spec_ID]
	species_common_name.text = Constants.SPEC_NAMES[current_spec_ID]
	species_latin_name.text = Constants.SPEC_LATINS[current_spec_ID]
	species_flavortext.text = Constants.SPEC_FLAVORTEXTS[current_spec_ID]
	mass_label.text = generate_size_label(Constants.get_size_index(current_spec_ID))
	climate_label.text = Constants.get_pref_temp_str(current_spec_ID)
	num_universal_pop.text = str(GlobalProcessing.get_universal_pop(current_spec_ID))
	
	#Logic to add the diet images
	#Delete existing diet images
	for child in diet_hbox.get_children():
		if child is TextureRect:
			child.queue_free()
	
	for elt in Constants.get_diet_images(current_spec_ID):
		var rect = TextureRect.new()
		rect.texture = elt
		rect.expand_mode = TextureRect.EXPAND_FIT_WIDTH_PROPORTIONAL
		diet_hbox.get_child(1).add_sibling(rect) # Add the photo after the spacer
	
@onready var src_planet: TextureRect = $VBoxContainer/bottom_pane/next_day_menu/VBoxContainer/HBoxContainer/src_planet
@onready var dest_planet: TextureRect = $VBoxContainer/bottom_pane/next_day_menu/VBoxContainer/HBoxContainer/dest_planet
@onready var ferry_text: Label = $VBoxContainer/bottom_pane/next_day_menu/VBoxContainer/ferry_text

func generate_size_label(my_size:float) -> String:
	match my_size:
		2.00:
			return "Medium"
		1.00:
			return "Small"
		3.00:
			return "Large"
		_:
			return "generate_size_label error"

func new_day() -> void:
	set_src_picture(-1)
	set_dest_picture(-1)
	ferry_text.text = "No Voyage Planned"
	
func set_src_picture(planet_id: int) -> void:
	if (planet_id == -1):
		src_planet.texture = Constants.UNKNOWN_PLANET
	else:
		src_planet.texture = Constants.PLAN_PHOTOS[planet_id]
		ferry_text.text = "Ferry"

func set_dest_picture(planet_id: int) -> void:
	if (planet_id == -1):
		dest_planet.texture = Constants.UNKNOWN_PLANET
	else:
		dest_planet.texture = Constants.PLAN_PHOTOS[planet_id] 
		ferry_text.text = "Ferry"

#button pressed to go to left species
func _on_left_button_pressed() -> void:
	populate_gui(posmod(current_spec_ID - 1, NUM_SPEC))

func _on_right_button_pressed() -> void:
	populate_gui(posmod(current_spec_ID + 1, NUM_SPEC))

func _on_confirm_button_pressed() -> void:
	#Tells PLANET MANAGER that we want to confirm abduct
	if (curr_src_planet != null):
		emit_signal("confirm_abduct",curr_src_planet,curr_abduct_arr)
	else:
		emit_signal("confirm_abduct",null,curr_abduct_arr)
