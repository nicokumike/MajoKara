extends Control

@onready var margin_container: MarginContainer = $MarginContainer
@onready var value: Label = $MarginContainer/HBoxContainer/MarginContainer/Value

func _process(_delta: float) -> void:
	value.text = str(SignalBus.currency)
	margin_container.scale = Vector2(GlobalSettings.ui_scale, GlobalSettings.ui_scale)
