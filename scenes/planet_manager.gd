extends Node

##we need to stop multiple tooltips from existing


func _ready():
	for child: Planet in get_children():
		child.connect("tooltip_requested", disable_addtl_child_tooltips)
		child.connect("tooltip_dismissed", enable_addl_child_tooltips)

func disable_addtl_child_tooltips():
	print("disabling other tooltips")
	for child: Planet in get_children():
		child.allow_tooltips = false
	pass
	
func enable_addl_child_tooltips():
	for child: Planet in get_children():
		child.allow_tooltips = true
	pass
