extends RichTextLabel

var planet_data: Dictionary
var population: int
var planet_name: String
var climate: String

func _ready():
	bbcode_enabled = true
	custom_minimum_size = Vector2(300, 64)
	

func set_planet_info(dict: Dictionary) -> void:
	print("set_planet_info")
	text = str(dict) 
	
