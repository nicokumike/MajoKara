extends Camera2D

#@onready var camera_base = $"."
var zoom_factor = 4
var dragging = false
var resizing = false
var tween : Tween
@export var camera_speed = 400
#var last_mouse_x = 0.0
@onready var resize_timer = $"../Resize_Timer"
#Size of window, default setting: 1920x1080.
@onready var window_size : Vector2 = get_viewport().get_visible_rect().size
#Offset to add to the camera in case of resizing.
@onready var window_offset : Vector2 = Vector2(0,0)

func _unhandled_input(event):
	if !SignalBus.cutscene_is_active:
		if event is InputEventMouseButton:
			if event.button_index == MOUSE_BUTTON_RIGHT:
				dragging = event.pressed
				#last_mouse_x = event.position.x

		if event is InputEventMouseMotion and dragging:
			var mouse_delta_x = event.relative.x
			global_position.x -= mouse_delta_x * (1.0 / zoom_factor)

func _ready():
	SignalBus.connect("cutscene_start", new_state)
	position.y = get_viewport().get_visible_rect().size.y / 2
	get_tree().get_root().size_changed.connect(resize)
	zoom_math()

func resize():
	#Resizing halted for performance probably i dunno XP
	resize_timer.start()
	
func _process(_delta):
	if !SignalBus.cutscene_is_active:
		zoom = Vector2(zoom_factor, zoom_factor)
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
			offset = window_offset
			position.y = get_viewport().get_visible_rect().size.y / 2
		2:
			offset = window_offset + Vector2(0.0, (get_viewport().get_visible_rect().size.y / 4 - 16))
			position.y = get_viewport().get_visible_rect().size.y / 2
		4: 
			offset = window_offset + Vector2(0.0, (get_viewport().get_visible_rect().size.y * 3/8 - 24))
			position.y = get_viewport().get_visible_rect().size.y / 2

func new_state(cutscene_location) -> void:
	if tween:
		tween.kill()
	tween = create_tween()
	tween.set_trans(Tween.TRANS_SINE)
	var distance = global_position.distance_to(cutscene_location)
	var tween_time = distance / camera_speed
	tween.tween_property(self, "global_position:x", cutscene_location.x, tween_time)
