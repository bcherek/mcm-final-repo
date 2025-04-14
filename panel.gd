extends Panel  # or any Control-derived node
#

var tooltip_instance: RichTextLabel



func _make_custom_tooltip(for_text: String) -> Object:
	
	var tooltip_scene = preload("res://tooltip2.tscn")
	tooltip_instance = tooltip_scene.instantiate()
	
	
	
	print(get_tree_string())
	print(get_tree().root)
	print()
	
	var planet_info: Dictionary = get_tree().root.get_node("Planet").get_planet_info()
	tooltip_instance.set_planet_info(planet_info)
	
	return tooltip_instance
