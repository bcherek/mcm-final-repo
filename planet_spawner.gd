@tool
extends Node2D

# Define the grid region with an exported property so it can be adjusted in the editor.
@export var grid_region: Rect2 = Rect2(0, 0, 640, 640)
@export var num_rows: int = 3
@export var num_cols: int = 5
@export var spawn_chance_at_intersect: float = 0.7

func _draw():
	var start_x = grid_region.position.x
	var end_x = grid_region.position.x + grid_region.size.x
	var start_y = grid_region.position.y
	var end_y = grid_region.position.y + grid_region.size.y

	var deltaX = (end_x - start_x) / (num_cols)
	var deltaY = (end_y - start_y) / (num_rows)
	
	if not Engine.is_editor_hint():
		return
		
	
	# Draw the outer rectangle representing the grid region.
	#draw_rect(grid_region, Color(0, 1, 0, 0.3), false, 2)

	# Calculate the start and end positions of the grid.
		# Draw vertical grid lines.
	for i in range(num_cols+1):
		var x = (i * deltaX) + start_x
		var from_point = Vector2(x, start_y)
		var to_point = Vector2(x, end_y)
		draw_line(from_point, to_point, Color(1, 0, 0, 0.7), 1)

	# Draw horizontal grid lines.
	for j in range(num_rows+1):
		var y = (j * deltaY) + start_y
		var from_point = Vector2(start_x, y)
		var to_point = Vector2(end_x, y)
		draw_line(from_point, to_point, Color(1, 0, 0, 0.7), 1)

func _ready():
	num_rows -= 1 #change these values to make it more intutive
	num_cols -= 1
	# Update the drawing in the editor.
	#print("aaaaa")
	if Engine.is_editor_hint():
		print("aaa")
		queue_redraw()
	else:
		# At runtime, call your function that populates the grid.
		spawn_planets()

func spawn_planets():
	var start_x = grid_region.position.x
	var end_x = grid_region.position.x + grid_region.size.x
	var start_y = grid_region.position.y
	var end_y = grid_region.position.y + grid_region.size.y

	var deltaX = (end_x - start_x) / num_cols
	var deltaY = (end_y - start_y) / num_rows
	#var content_node = get_node("GridContent")
	# Calculate number of columns and rows from grid_region size and spacing.
	
	# Preload your scene.
	var MyScene = preload("res://planet.tscn")
	
	var offset_factor_x = 0.4
	var offset_factor_y = 0.6

	
	for x in range(num_cols + 1):
		for y in range(num_rows + 1):
			# Calculate base position relative to the grid_region.
			
			var base_x_pos = start_x + (x * deltaX)
			var base_y_pos = start_y + (y * deltaY)

			# Calculate a random offset independent of the base position.
			var offset_x = randf_range(-offset_factor_x,offset_factor_x) * deltaX
			var offset_y = randf_range(-offset_factor_y,offset_factor_y) * deltaY

			if (randf() < spawn_chance_at_intersect):
				#create planet
				var instance = MyScene.instantiate(PackedScene.GEN_EDIT_STATE_DISABLED)
				instance.position = Vector2(base_x_pos + offset_x, base_y_pos + offset_y)
				#instance.position = Vector2(base_x_pos, base_y_pos)

				add_child(instance)

			
