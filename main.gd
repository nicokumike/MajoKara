extends Node2D

@onready var viewport := $Viewport
@onready var label := $CanvasLayer/Label
@onready var shader_material := label.material

func _ready():
	# Assign the ViewportTexture to the shader
	var bg_texture := viewport.get_texture()
	shader_material.set_shader_param("background_tex", bg_texture)

	# Send screen size (optional if you're using SCREEN_UV only)
	shader_material.set_shader_param("screen_size", get_viewport_rect().size)
