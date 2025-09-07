extends Node2D

@export var name_of_plant := "base"
#@export var stalk_growth_factor : int
@export var max_growth_height : int
@export var grow_complete_time : int
@export var grow_time_tick : float
@export var growth_chance_decay : int
@export var superior_genes_hit : int
@export var head_width : int
@export var magic_yeild : int
@export var weight : int

@onready var growth_complete: Timer = $GrowthComplete
@onready var grow_tick: Timer = $GrowTick
@onready var plant_head: Sprite2D = $PlantHead
@onready var plant_stalk: Line2D = $PlantStalk
@onready var grow_finish_particles: GPUParticles2D = $PlantHead/GrowFinish

var current_growth_chance := 100
var current_growth_amount := 0

func _ready() -> void:
	growth_complete.wait_time = grow_complete_time
	grow_tick.wait_time = grow_time_tick
	growth_complete.start()
	grow_tick.start()

func _on_growth_complete_timeout() -> void:
	grow_tick.stop()
	place_head()

func _on_grow_tick_timeout() -> void:
	var random_tick_speed = randf_range(.1, .4)
	grow_tick.wait_time = random_tick_speed
	attempt_growth()
	
func attempt_growth() -> void:
	var random_growth_attempt = randf_range(0, 100)
	if random_growth_attempt <= superior_genes_hit:
		current_growth_chance = 100
		current_growth_amount -= 1
		plant_stalk.set_point_position(1, Vector2(0, current_growth_amount))
		print("lucky!")
	elif random_growth_attempt <= current_growth_chance:
		current_growth_amount -= 1
		plant_stalk.set_point_position(1, Vector2(0, current_growth_amount))
		current_growth_chance -= growth_chance_decay
	else:
		current_growth_chance += growth_chance_decay / 2
		
func place_head():
	var randomness = randi_range(1,2)
	if randomness == 2:
		plant_head.scale.x = -1
	plant_head.position.y = current_growth_amount
	plant_head.visible = true
	grow_finish_particles.emitting = true
