class_name SpeciesModifier extends HBoxContainer

@onready var spec_label: Label = $species_name
@onready var trend: RichTextLabel = $label
var spec_id: int

#Instantiator needs to update these fields and then call update_spec_label
var spec_name: String
var spec_displayed_pop: String

signal request(delta: float)


func update_spec_label() -> void:
	spec_label.text = spec_name + ": " + spec_displayed_pop

func update_trend_label(input_text: String, color: Color) -> void:
	trend.clear()
	trend.push_color(color)
	trend.add_text(input_text)


func _on_minus_pressed() -> void:
	emit_signal("request", 1.0)

func _on_plus_pressed() -> void:
	emit_signal("request", -1.0)
