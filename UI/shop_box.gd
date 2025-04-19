extends Control
@onready var nine_patch_rect = $NinePatchRect
@onready var margin_container = $NinePatchRect/MarginContainer
@onready var v_box_container = $NinePatchRect/MarginContainer/VBoxContainer
@onready var shop_name = $NinePatchRect/MarginContainer/VBoxContainer/ShopName

@onready var BUTTON = preload("res://UI/shop_button.tscn")

var amount_of_buttons : int

func _set_buy_options():
	var button = BUTTON.instantiate()
	v_box_container.add_child(button)
	button.upgrade_name.text = "POOOOOOOP"
	resize()


func _ready():
	resize()
	_set_buy_options()
	
func resize():
	nine_patch_rect.pivot_offset.x = size.x / 2
	nine_patch_rect.pivot_offset.y = size.y
	self.pivot_offset.x = size.x / 2
	self.pivot_offset.y = size.y
	self.size = margin_container.size
	self.custom_minimum_size = margin_container.size
	nine_patch_rect.size = margin_container.size
