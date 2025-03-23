extends TextureButton





func _on_toggled(toggled_on):
	if toggled_on == true:
		position.y -= 5
	else:
		position.y += 5
