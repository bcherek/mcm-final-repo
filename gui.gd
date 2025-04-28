extends Control




## Species Info

const SPEC_PHOTOS = [
preload("res://assets/species_pictures/spec_0.jpg"),
preload("res://assets/species_pictures/spec_1.jpg"),
preload("res://assets/species_pictures/spec_2.jpg")]

##unknown species photo
const UNKNOWN_SPEC = preload("res://assets/species_pictures/unknown_spec.png")

const SPEC_COMMON_NAMES: Array[String] = [
	"Abefrerf",
	"Berfijerf",
	"Cerhgferg"]
const SPEC_LATIN_NAMES: Array[String] = [
	"oobbedy goobedy", "eebeedy goobedy", "glip glop"]
const SPEC_FLAVORTEXTS: Array[String] = [
	"Known to be sseiufohjsoijef odoidsrjfoidjr gdoitgjirjgjir rijgrijgirjg ririrjr. Likes iudjrgijdrg.",
	"Goobedytt oiejg eorigjeoirjg eoirjgirig eeee species B so vcool!",
	"arg oooh hahhhh eeee world stuff species C yay."]
var known_species: Array[bool] = [true, true, false]

var current_spec_ID = 0
const NUM_SPEC = 3


@onready var species_common_name: Label = $"VBoxContainer/species_log_hbox/Panel/HBoxContainer/species info/VBoxContainer/Species Common Name"
@onready var species_log_hbox: HBoxContainer = $VBoxContainer/species_log_hbox
@onready var species_photo: TextureRect = $"VBoxContainer/species_log_hbox/Panel/HBoxContainer/species info/VBoxContainer/MarginContainer/species photo"
@onready var species_latin_name: Label = $"VBoxContainer/species_log_hbox/Panel/HBoxContainer/species info/VBoxContainer/species latin name"
@onready var species_flavortext: Label = $"VBoxContainer/species_log_hbox/Panel/HBoxContainer/species info/VBoxContainer/species flavortext"

func _ready() -> void:
	species_log_hbox.visible = false

#button pressed to show the menu
func _on_open_menu_pressed() -> void:
	species_log_hbox.visible = !species_log_hbox.visible
	if (species_log_hbox):
		populate_gui(current_spec_ID)

func populate_gui(speciesID: int):
	current_spec_ID = speciesID
	if (known_species[current_spec_ID]):
		## The player knows about the given species. Populate the gui accordingly.
		species_photo.texture = SPEC_PHOTOS[current_spec_ID]
		species_common_name.text = SPEC_COMMON_NAMES[current_spec_ID]
		species_latin_name.text = SPEC_LATIN_NAMES[current_spec_ID]
		species_flavortext.text = SPEC_FLAVORTEXTS[current_spec_ID]
	else:
		##the player DOES NOT know about the species. Leave the gui empty/mysterious
		species_photo.texture = UNKNOWN_SPEC
		species_common_name.text = "Unknown Species"
		species_latin_name.text = "???"
		species_flavortext.text = "This species may be extinct, or simply unknown. Discover more planets!"

#button pressed to go to left species
func _on_left_button_pressed() -> void:
	populate_gui(((current_spec_ID - 1) % NUM_SPEC))

func _on_right_button_pressed() -> void:
	populate_gui(((current_spec_ID + 1) % NUM_SPEC))
