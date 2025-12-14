extends Node2D

@onready var small_plants: Sprite2D = $SmallPlants

func _ready() -> void:
	var graphic = randi_range(0, 3)
	small_plants.frame = graphic
	var horiz_flip = randi_range(0, 1)
	if horiz_flip == 0:
		small_plants.scale.x = -1
