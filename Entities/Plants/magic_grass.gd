extends Node2D

@onready var line_2d: Line2D = $Line2D
@onready var grow_clock: Timer = $GrowClock
@onready var ray_cast_2d: RayCast2D = $RayCast2D


var growth_factor = 1
var growth_amnt = 0
var maximum_growth = 0
var value = 0
var max_plant_cap

func _ready() -> void:
	var cap_chance = randf_range(0, 1)
	if cap_chance > .99:
		max_plant_cap = -30
	elif cap_chance > .95:
		max_plant_cap = -20
	elif cap_chance > .84:
		max_plant_cap = -15
	elif cap_chance > .71:
		max_plant_cap = -13
	elif cap_chance > .50:
		max_plant_cap = -10
	else:
		max_plant_cap = -5
	var max_growth_copy = randi_range(-1, max_plant_cap)
	maximum_growth = max_growth_copy
	grow_clock.start()
	
func _physics_process(delta: float) -> void:
	if ray_cast_2d.is_colliding() == true:
		var obj = ray_cast_2d.get_collider()
		if obj.has_method("connect_fairy"):
			obj.connect_fairy(self, value)
		
func fairy_acknowledges_me():
	print("hell ya")
	
func grow(growth_factor):
	growth_amnt += growth_factor
	value += growth_factor
	if growth_amnt > maximum_growth:
		line_2d.set_point_position(0, Vector2(0, growth_amnt))
	else:
		grow_clock.stop()
		print(abs(value))

func _on_grow_clock_timeout() -> void:
	grow_clock.wait_time = randf_range(0, 1.2)
	grow(randi_range(-1, -2))

func _collected(collection_amnt):
	growth_amnt -= collection_amnt
	value -= collection_amnt
	if value > 0:
		line_2d.set_point_position(0, Vector2(0, growth_amnt))
	else:
		queue_free()
	
