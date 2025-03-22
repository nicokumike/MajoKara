extends Camera2D

#@onready var camera_base = $"."
var zoom_factor = 1
var dragging = false
var resizing = false
#var last_mouse_x = 0.0
@onready var resize_timer = $"../Resize_Timer"
#Size of window, default setting: 1920x1080.
@onready var window_size : Vector2 = get_viewport().get_visible_rect().size
#Offset to add to the camera in case of resizing.
@onready var window_offset : Vector2 = Vector2(0,0)

func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_RIGHT:
			dragging = event.pressed
			#last_mouse_x = event.position.x

	if event is InputEventMouseMotion and dragging:
		var mouse_delta_x = event.relative.x
		global_position.x -= mouse_delta_x * (1.0 / zoom_factor)

func _ready():
	position.y = get_viewport().get_visible_rect().size.y / 2
	get_tree().get_root().size_changed.connect(resize)
	pass

func resize():
	resize_timer.start()
	print("currently resizing")
	print(get_viewport().get_visible_rect().size.x)
	print(get_viewport().get_visible_rect().size.y)
	
func _process(_delta):
	#Get correct camera position and offset based on window size, in case of resizing
	#if get_viewport().get_visible_rect().size != window_size:
		#window_offset.y += window_size.y - get_viewport().get_visible_rect().size.y
		#window_size = get_viewport().get_visible_rect().size
		#position = window_size / 2
		#offset = window_offset
		
	#Zoom camera
	zoom = Vector2(zoom_factor, zoom_factor)
	
	#Offset the camera to maintain relative position
	zoom_math()
			
	#Change current camera zoom
	if(Input.is_action_just_pressed("zoom_in")):
		if zoom_factor != 4:
			zoom_factor = zoom_factor * 2
	if(Input.is_action_just_pressed("zoom_out")):
		if zoom_factor != 1:
			zoom_factor = zoom_factor / 2


func _on_resize_timer_timeout():
	zoom_math()
	
func zoom_math():
	match zoom_factor:
		1:
			position.y = get_viewport().get_visible_rect().size.y / 2
			offset = window_offset
		2:
			#camera_base.offset = Vector2(0.0, 74.0)
			offset = window_offset + Vector2(0.0, (get_viewport().get_visible_rect().size.y / 4 - 16))
			position.y = get_viewport().get_visible_rect().size.y / 2
			#position.y = get_viewport().get_visible_rect().size.y / 2
		4: 
			#ZOOM IN MAX
			#camera_base.offset = Vector2(0.0, 111.0)
			#offset = window_offset + Vector2(0.0, (window_size.y * 3/8 - window_size.y / 10) * 1.1)
			offset = window_offset + Vector2(0.0, (get_viewport().get_visible_rect().size.y * 3/8 - 24))
			position.y = get_viewport().get_visible_rect().size.y / 2
	
