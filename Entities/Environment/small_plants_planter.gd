extends Path2D
@onready var path_follow_2d: PathFollow2D = $PathFollow2D
@onready var plants = preload("res://Entities/Plants/small_plant.tscn")
@onready var timer: Timer = $Timer
func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	pass
		#print(path_follow_2d.progress)
		
func plant():
	for i in 3777:
		var rand = randi_range(0,1)
		if rand == 0:
			var small_ps = plants.instantiate()
			get_tree().get_root().add_child(small_ps)
			small_ps.global_position = path_follow_2d.global_position
		var rand_dist = randi_range(1, 1)
		path_follow_2d.progress += rand_dist
		if path_follow_2d.progress > 3777:
			break
	print("done")
	#print(path_follow_2d.progress)
	


func _on_timer_timeout() -> void:
	plant()
