extends Control

@onready var color_rect = $ColorRect
@onready var nine_patch_rect = $NinePatchRect
@onready var margin_container = $NinePatchRect/MarginContainer
@onready var v_box_container = $NinePatchRect/MarginContainer/VBoxContainer
@onready var shop_name = $NinePatchRect/MarginContainer/VBoxContainer/ShopName
@onready var BUTTON = preload("res://UI/shop_button.tscn")

var amount_of_buttons : int
var active : bool = false

#func _set_buy_options():
	#var button = BUTTON.instantiate()
	#v_box_container.add_child(button)
	#button.upgrade_name.text = "POOOOOOOP"
	#resize()

func set_buy_options(building_name : String):
	var buy_options = ShopInformation.read_upgrades(building_name)
	for item in buy_options:
		pass

func open_shop(building_name):
	set_buy_options(building_name)
	active = true

func _ready():
	resize()
	#_set_buy_options()
	
#func resize():
	#nine_patch_rect.pivot_offset.x = size.x / 2
	#nine_patch_rect.pivot_offset.y = size.y
	#self.pivot_offset.x = size.x / 2
	#self.pivot_offset.y = size.y
	#self.size = margin_container.size
	#self.custom_minimum_size = margin_container.size
	#nine_patch_rect.size = margin_container.size
	
func resize():
	self.size = margin_container.size
	self.custom_minimum_size = margin_container.size
	nine_patch_rect.size = margin_container.size
	color_rect.size = nine_patch_rect.size
	
func initiate(building_name : String):
	visible = true
	shop_name.text = building_name
	var screen_mouse_position = get_viewport().get_mouse_position()
	var offset_vector = Vector2(-nine_patch_rect.size.x / 2, -nine_patch_rect.size.y)
	global_position = (get_viewport().get_screen_transform() * get_viewport().get_canvas_transform()).affine_inverse() * screen_mouse_position + offset_vector
	resize()
	
func deactivate():
	if !active:
		visible = false

func _on_shop_name_resized():
	if margin_container != null:
		resize()
