extends Control

var ui_scale = 2
var ui_scale_factor = 2
var Stime = 0
@onready var scale_label = $UiScale/HBoxContainer/VBoxContainer3/ScaleLabel
@onready var ui_scale_panel = $UiScale
@onready var sound_settings_panel = $SoundSettings
@onready var save_button_label = $SaveSettings/MarginContainer/MarginContainer/VBoxContainer/HBoxContainer/VBoxContainer2/SaveButtonLabel
@onready var save_timer = $SaveSettings/MarginContainer/MarginContainer/VBoxContainer/HBoxContainer/VBoxContainer2/SaveButtonLabel/SaveTimer
@onready var return_timer = $SaveSettings/MarginContainer/MarginContainer/VBoxContainer/HBoxContainer/VBoxContainer2/SaveButtonLabel/ReturnTimer
@onready var auto_save_x = $SaveSettings/MarginContainer/MarginContainer/VBoxContainer/MarginContainer2/HBoxContainer2/MarginContainer2/NinePatchRect/AutoSaveButton/AutoSaveX
@onready var auto_save_check = $SaveSettings/MarginContainer/MarginContainer/VBoxContainer/MarginContainer2/HBoxContainer2/MarginContainer2/NinePatchRect/AutoSaveButton/AutoSaveCheck
@onready var save_settings_panel = $SaveSettings




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


func _on_save_button_pressed():
	Stime = 0
	save_button_label.text = str(" Saving ")
	save_timer.start()
	
func _on_save_timer_timeout():
	print("dot")
	if Stime < 3:
		Stime += 1
		save_button_label.text += str(". ")
	else:
		Stime = 0
		save_timer.stop()
		save_button_label.text = str(" Saved! ")
		return_timer.start()
		
func _on_return_timer_timeout():
	save_button_label.text = str(" Save ")


func _on_auto_save_button_toggled(toggled_on):
	if toggled_on == true:
		auto_save_check.visible = true
		auto_save_x.visible = false
	else:
		auto_save_check.visible = false
		auto_save_x.visible = true


func _on_save_button_toggled(toggled_on):
	if toggled_on == true:
		save_settings_panel.visible = true
	else:
		save_settings_panel.visible = false
