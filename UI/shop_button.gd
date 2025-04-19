extends Control
@onready var box = $Box
@onready var upgrade_name = $Box/MarginContainer/HBoxContainer/UpgradeName
@onready var currency_type = $Box/MarginContainer/HBoxContainer/CurrencyType
@onready var amount = $Box/MarginContainer/HBoxContainer/Amount
@onready var cost = $Box/MarginContainer/HBoxContainer/Cost
@onready var button = $Box/Button
@onready var margin_container = $Box/MarginContainer
@onready var color_rect = $Box/ColorRect

func _ready():
	self.size = margin_container.size
	self.custom_minimum_size = margin_container.size
	box.size = margin_container.size

func _on_button_mouse_entered():
	color_rect.visible = true

func _on_button_mouse_exited():
	color_rect.visible = false
