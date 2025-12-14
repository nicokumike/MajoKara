extends PathFollow2D

@onready var planter = $"."
@onready var PLANT = preload("res://Entities/Plants/Magriens/magrien.tscn")
@onready var STOPPER = preload("res://Entities/Fairies/fairy_stopper.tscn")
@onready var ground = $"../.."
@onready var count = $"../../Count"
@onready var timer: Timer = $"../Timer"

var counted = 0
var max_plant_spawn = 100
var max_forest_size = 200
var used_numbers = []

func _ready() -> void:
	pass
	#SignalBus.connect("collected", plant_collected)
	#planter.progress = 0
	#var stopper_spawn = STOPPER.instantiate()
	#ground.add_child.call_deferred(stopper_spawn)
	#stopper_spawn.global_position = planter.global_position
	#stopper_spawn.position.x += 20
	#timer.start()
	
func plant_collected(id):
	if id in used_numbers:
		counted -= 1
		for item in used_numbers:
			if item == id:
				used_numbers.erase(item)

func _on_timer_timeout():
	if counted < max_plant_spawn:
		var plant_point = randi_range(0, max_forest_size)
		if used_numbers.has(plant_point):
			pass
		else:
			used_numbers.append(plant_point)
			planter.progress = plant_point
			var to_be_plant = PLANT.instantiate()
			ground.add_child(to_be_plant)
			#to_be_plant.id = int(plant_point)
			to_be_plant.global_position = planter.global_position
			counted += 1
	else:
		pass

func _plant():
	pass
