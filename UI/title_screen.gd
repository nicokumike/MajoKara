extends Control
@onready var color_rect: ColorRect = $ColorRect

func _ready() -> void:
	scale = Vector2(2,2)

func _on_start_mouse_entered() -> void:
	color_rect.visible = true


func _on_start_mouse_exited() -> void:
	color_rect.visible = false
