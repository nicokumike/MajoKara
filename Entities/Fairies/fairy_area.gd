extends Area2D

signal connect_grass
signal restart

func connect_fairy(sender, value):
	emit_signal("connect_grass", sender, value)
func restart_search():
	emit_signal("restart")
	
