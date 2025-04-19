extends Node2D

@onready var resize_timer = $"../Resize_Timer"
@onready var forest = $Forest
@onready var planter = $Forest/Planter
@onready var PLANT = preload("res://Entities/Plants/bulb_plant.tscn")
@onready var POPUP = preload("res://UI/shop_box.tscn")
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
	GlobalSettings.cauldron_location = cauldron.global_position
	print(position.y)


func _on_plants_house_button_mouse_entered():
	pass # Replace with function body.

func _on_witch_house_button_mouse_entered():
	pass # Replace with function body.

func _on_fairy_pond_button_mouse_entered():
	print("hallo")
	var shopup = POPUP.instantiate()
	add_child(shopup)
	shopup.global_position = get_global_mouse_position()
	

func _on_ojamajo_birth_button_mouse_entered():
	pass # Replace with function body.
