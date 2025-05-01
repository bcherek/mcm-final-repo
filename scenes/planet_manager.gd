extends Node

##we need to stop multiple tooltips from existing
@onready var global_processing: Node = $"../Global_Processing"
var grant_tooltip_rights: bool = true

func _ready():
	for child: Planet in get_children():
		child.connect("tooltip_requested", disable_addtl_child_tooltips.bind(child))
		child.connect("tooltip_dismissed", enable_addl_child_tooltips)
		child.connect("planet_data_requested", give_planet_data.bind(child))
		
func give_planet_data(planet: Planet):
	#passes the data from global processing into the planet itself
	planet.set_planet_data(global_processing.export_planet(planet.planet_ID))

		
func disable_addtl_child_tooltips(planet: Planet):
	print("A tooltip was requested")
	if (grant_tooltip_rights):
		print("we'll allow this child to have a tooltip")
		planet.open_tooltip()
		grant_tooltip_rights = false
	else:
		print("child tooltip request denied")
	
func enable_addl_child_tooltips():
	print("child closed tooltip")
	grant_tooltip_rights = true
