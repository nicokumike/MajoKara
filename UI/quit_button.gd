extends Control

@onready var v_box_container = $VBoxContainer

func _ready():
	v_box_container.scale = Vector2(GlobalSettings.ui_scale, GlobalSettings.ui_scale)
