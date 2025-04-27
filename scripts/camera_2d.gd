extends Camera2D


const DEAD_ZONE: float = 0.6


var zoom_min = Vector2(.5,.5)
var zoom_max = Vector2(2,2)
var zoom_speed = Vector2(.2,.2)
var des_zoom = zoom

var arrow_speed = 1000

@onready var background: Sprite2D = $background

func _process(delta: float) -> void:
	#This variable stores the mouse position centered on (0,0). There are negative #'s
	var centered_mouse_pos: Vector2 = get_viewport().get_mouse_position() - get_viewport_rect().get_center()

	# move the camera if the mouse is at the edge of the camera
	if (abs((centered_mouse_pos.x / get_viewport_rect().get_center().x)) > DEAD_ZONE):
		position.x += (centered_mouse_pos.x - position.x) * delta * 0.5
	
	if (abs((centered_mouse_pos.y / get_viewport_rect().get_center().y)) > DEAD_ZONE):
		position.y += (centered_mouse_pos.y - position.y) * delta * 0.5	


	zoom = lerp(zoom, des_zoom, 0.2)
	#$background.scale = Vector2(2,2) - zoom
	
	if Input.is_action_pressed("up"):
		position.y -= arrow_speed * delta
	if Input.is_action_pressed("down"):
		position.y += arrow_speed * delta
	if Input.is_action_pressed("right"):
		position.x += arrow_speed * delta
	if Input.is_action_pressed("left"):
		position.x -= arrow_speed * delta
		

func _input(event: InputEvent) -> void:
	#handle zoom based on scroll event
	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index == MOUSE_BUTTON_WHEEL_UP:
				if zoom > zoom_min:
					des_zoom -= zoom_speed
			if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
				if zoom < zoom_max:
					des_zoom += zoom_speed
		des_zoom = des_zoom.clamp(zoom_min,zoom_max) 		
