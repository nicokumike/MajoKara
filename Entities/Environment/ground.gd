extends Node2D

#@onready var resize_timer = $"../Resize_Timer"
#@onready var forest = $Forest
#@onready var planter = $Forest/Planter
@onready var PLANT = preload("res://Entities/Plants/bulb_plant.tscn")
@onready var POPUP = preload("res://UI/shop_box.tscn")
@onready var cauldron: Sprite2D = $Cauldron

@onready var cutscene_beginning: Marker2D = $CameraCutsceneX/Cutscene_Beginning


func _ready():
	SignalBus.cutscene_beginning_y = cutscene_beginning.global_position
	position.y = get_viewport().get_visible_rect().size.y - 32
	SignalBus.ground_position.y = position.y
	GlobalSettings.cauldron_location = cauldron.global_position
	SignalBus.emit_signal("cutscene_start", cutscene_beginning.global_position)
	
	
func _process(_delta):
	pass


func _on_resize_timer_timeout():
	position.y = get_viewport().get_visible_rect().size.y - 32
	SignalBus.ground_position.y = position.y
	GlobalSettings.cauldron_location = cauldron.global_position

func _move_camera_to_cutscene():
	pass
