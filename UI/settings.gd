extends Control

var ui_scale = 2
var ui_scale_factor = 2

@onready var scale_label = $UiScale/HBoxContainer/VBoxContainer3/ScaleLabel
@onready var ui_scale_panel = $UiScale
@onready var sound_settings_panel = $SoundSettings



func _ready():
	scale_label.text = str("2x")
	scale = Vector2(ui_scale_factor, ui_scale_factor)

func _on_ui_scale_down_pressed():
	if ui_scale == 1:
		ui_scale = 3
		change_ui_scale(ui_scale)
	else:
		ui_scale -= 1
		change_ui_scale(ui_scale)
func _on_ui_scale_up_pressed():
	if ui_scale == 3:
		ui_scale = 1
		change_ui_scale(ui_scale)
	else:
		ui_scale += 1
		change_ui_scale(ui_scale)

func change_ui_scale(value):
	match value:
		1: 
			ui_scale_factor = 1
			scale = Vector2(ui_scale_factor, ui_scale_factor)
			scale_label.text = str("1x")
		2:
			ui_scale_factor = 2
			scale = Vector2(ui_scale_factor, ui_scale_factor)
			scale_label.text = str("2x")
		3:
			ui_scale_factor = 4
			scale = Vector2(ui_scale_factor, ui_scale_factor)
			scale_label.text = str("4x")


func _on_ui_scale_button_toggled(toggled_on):
	if toggled_on == true:
		ui_scale_panel.visible = true
	else:
		ui_scale_panel.visible = false


func _on_sound_button_toggled(toggled_on):
	if toggled_on == true:
		sound_settings_panel.visible = true
	else:
		sound_settings_panel.visible = false
