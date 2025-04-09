extends Control

@onready var margin_container: MarginContainer = $MarginContainer

func _process(_delta: float) -> void:
	margin_container.scale = Vector2(GlobalSettings.ui_scale, GlobalSettings.ui_scale)
