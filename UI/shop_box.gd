extends Control
@onready var nine_patch_rect = $NinePatchRect
@onready var margin_container = $NinePatchRect/MarginContainer
@onready var v_box_container = $NinePatchRect/MarginContainer/VBoxContainer
@onready var shop_name = $NinePatchRect/MarginContainer/VBoxContainer/ShopName

func _ready():
	self.size = margin_container.size
	self.custom_minimum_size = margin_container.size
	nine_patch_rect.size = margin_container.size
	
