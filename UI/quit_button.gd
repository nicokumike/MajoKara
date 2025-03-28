extends Control

@onready var v_box_container = $VBoxContainer
@onready var labelsave = $VBoxContainer/QuitSettings/MarginContainer/NinePatchRect/Label
@onready var labelquit = $VBoxContainer/QuitSettings2/MarginContainer/NinePatchRect/Label
@onready var color_rectsave = $VBoxContainer/QuitSettings/MarginContainer/NinePatchRect/ColorRect
@onready var color_rectquit = $VBoxContainer/QuitSettings2/MarginContainer/NinePatchRect/ColorRect

func _ready():
	v_box_container.scale = Vector2(GlobalSettings.ui_scale, GlobalSettings.ui_scale)




func _on_save_quit_pressed():
	get_tree().quit()


func _on_quit_pressed():
	get_tree().quit()


func _on_quit_mouse_entered():
	labelquit.modulate = Color(0.208, 0.157, 0.271)
	color_rectquit.visible = true


func _on_quit_mouse_exited():
	labelquit.modulate = Color.WHITE
	color_rectquit.visible = false


func _on_save_quit_mouse_entered():
	labelsave.modulate = Color(0.208, 0.157, 0.271)
	color_rectsave.visible = true


func _on_save_quit_mouse_exited():
	labelsave.modulate = Color.WHITE
	color_rectsave.visible = false
