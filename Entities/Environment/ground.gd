extends Node2D

@onready var resize_timer = $"../Resize_Timer"

func _ready():
	position.y = get_viewport().get_visible_rect().size.y - 32
	
func _process(_delta):
	pass


func _on_resize_timer_timeout():
	position.y = get_viewport().get_visible_rect().size.y - 32
