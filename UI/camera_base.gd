extends Camera2D

@onready var camera_base = $"."
var zoom_factor = 1
var dragging = false
var last_mouse_x = 0.0

func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_RIGHT:
			dragging = event.pressed
			last_mouse_x = event.position.x

	if event is InputEventMouseMotion and dragging:
		var mouse_delta_x = event.relative.x
		camera_base.global_position.x -= mouse_delta_x * (1.0 / zoom_factor)

func _process(_delta):
	camera_base.zoom = Vector2(zoom_factor, zoom_factor)
	if zoom_factor == 1:
		camera_base.offset = Vector2(0.0, 0.0)
	elif zoom_factor == 2:
		camera_base.offset = Vector2(0.0, 74.0)
	elif zoom_factor == 4:
		camera_base.offset = Vector2(0.0, 111.0)
	#if(Input.is_action_just_pressed("right_click")):
		#print("pressed")
	#if(Input.is_action_pressed("right_click")):
		#print("held down")
	#if(Input.is_action_just_released("right_click")):
		#print("released")
	if(Input.is_action_just_pressed("zoom_in")):
		if zoom_factor == 4:
			pass
		else:
			zoom_factor = zoom_factor * 2
	if(Input.is_action_just_pressed("zoom_out")):
		if zoom_factor == 1:
			pass
		else:
			zoom_factor = zoom_factor / 2
