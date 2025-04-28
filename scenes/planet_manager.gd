extends Node

##we need to stop multiple tooltips from existing
@onready var global_processing: Node = $"../Global_Processing"


func _ready():
	for child: Planet in get_children():
		child.connect("tooltip_requested", disable_addtl_child_tooltips)
		child.connect("tooltip_dismissed", enable_addl_child_tooltips)
		child.connect("planet_datawdawd", give_planet_data.bind(child))
		
func give_planet_data(planet: Planet):
	#passes the data from global processing into the planet itself
	planet.set_planet_data(global_processing.export_planet(planet.planet_ID))

		
func disable_addtl_child_tooltips():
	print("disabling other tooltips")
	for child: Planet in get_children():
		child.allow_tooltips = false
	pass
	
func enable_addl_child_tooltips():
	for child: Planet in get_children():
		child.allow_tooltips = true
	pass
