extends Node2D

@onready var resize_timer = $"../Resize_Timer"
@onready var forest = $Forest
@onready var planter = $Forest/Planter
@onready var PLANT = preload("res://Entities/Plants/bulb_plant.tscn")
@onready var POPUP = preload("res://UI/shop_box.tscn")
@onready var cauldron: Sprite2D = $Cauldron
@onready var shop_box = $ShopBox


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
	shop_box.initiate("Plants House")

func _on_plants_house_button_mouse_exited():
	shop_box.deactivate()

func _on_witch_house_button_mouse_entered():
	shop_box.initiate("Witch House")

func _on_witch_house_button_mouse_exited():
	shop_box.deactivate()

func _on_fairy_pond_button_mouse_entered():
<<<<<<< Updated upstream
	print("hallo")
	var shopup = POPUP.instantiate()
	add_child(shopup)
	shopup.global_position = get_global_mouse_position()
	
=======
	shop_box.initiate("Fairypond")
	
func _on_fairy_pond_button_mouse_exited():
	shop_box.deactivate()
>>>>>>> Stashed changes

func _on_ojamajo_birth_button_mouse_entered():
	shop_box.initiate("Ojamajo Birth")

func _on_ojamajo_birth_button_mouse_exited():
	shop_box.deactivate()

func _on_witch_house_button_pressed():
	shop_box.open_shop("Witch House")

func _on_fairy_pond_button_pressed():
	shop_box.open_shop("Fairypond")
