class_name SpeciesModifier extends HBoxContainer

@onready var spec_label: Label = $species_name

func set_spec_name(text: String):
	spec_label.text = text
