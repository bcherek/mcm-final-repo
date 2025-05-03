extends Node




##we need to stop multiple tooltips from existing
@onready var global_processing = $"../Global_Processing"
var grant_tooltip_rights: bool = true
@onready var gui = $"../CanvasLayer/Gui"


# Set by Tooltip
# reset by this
var abduct_planet_dest_id = -1


func _ready():
	for child: Planet in get_children():
		child.connect("tooltip_requested", disable_addtl_child_tooltips.bind(child))
		child.connect("tooltip_dismissed", enable_addl_child_tooltips)
		child.connect("planet_data_requested", give_planet_data.bind(child))
		child.connect("abduct_gui", populate_abduct_gui.bind(child))
		child.connect("be_destination", set_destination.bind(child))
		
	gui.connect("confirm_abduct", tell_global_to_inc_time)

func give_planet_data(planet: Planet):
	
	print("Planet Manager: Planet Data Requested")
	#passes the data from global processing into the planet itself
	planet.set_planet_data(global_processing.export_planet(planet.planet_ID))

func set_destination(planet: Planet):
	print("set_destination")
	abduct_planet_dest_id = planet.planet_ID
	gui.set_dest_picture(abduct_planet_dest_id)
	print("abduct_planet_dest_id: " + str(abduct_planet_dest_id))

func populate_abduct_gui(populations: Array, planet: Planet):
	gui.populate_abduct_display(populations, planet)
	pass
	
func tell_global_to_inc_time(plan: Planet, abduct_pop_arr: Array):
	if (plan == null):
		global_processing.Increase_Time()
	else:
		global_processing.Increase_Time(abduct_planet_dest_id, plan.planet_ID, abduct_pop_arr)
	gui.empty_abduct_display()
	for child: Planet in get_children():
		child.empty_abduct_arr()
	abduct_planet_dest_id = -1
	gui.set_dest_picture(abduct_planet_dest_id)
	gui.increase_year()
	
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
