extends Node2D

@onready var resize_timer = $"../Resize_Timer"
@onready var forest = $Forest
@onready var planter = $Forest/Planter
@onready var PLANT = preload("res://Entities/Plants/bulb_plant.tscn")
@onready var cauldron: Sprite2D = $Cauldron


func _ready():
	position.y = get_viewport().get_visible_rect().size.y - 32
	SignalBus.ground_position.y = position.y
	GlobalSettings.cauldron_location = cauldron.global_position
	
	
func _process(_delta):
	pass


func _on_resize_timer_timeout():
	position.y = get_viewport().get_visible_rect().size.y - 32
	SignalBus.ground_position.y = position.y
	print(position.y)
