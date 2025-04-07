extends Area2D

signal connect_grass

func connect_fairy(sender, value):
	emit_signal("connect_grass", sender, value)
	
func _on_area_entered(area) -> void:
	print("detected somethin")
	if area is RayCast2D:
		print("raycast")
		var parent = area.get_parent()
		if parent and parent.has_method("handle_area_response"):
			parent.handle_area_response()
			print("madeit")
