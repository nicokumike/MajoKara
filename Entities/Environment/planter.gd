extends PathFollow2D

@onready var planter = $"."
@onready var PLANT = preload("res://Entities/Plants/bulb_plant.tscn")
@onready var ground = $"../.."
var counted = 0
@onready var count = $"../../Count"

func _on_timer_timeout():
	var plant_point = randf_range(0, 1)
	planter.progress_ratio = plant_point
	var to_be_plant = PLANT.instantiate()
	ground.add_child(to_be_plant)
	to_be_plant.global_position = planter.global_position
	counted += 1
	count.text = str(counted)
	
