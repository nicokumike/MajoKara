extends Path2D

@onready var path: Path2D = $"."
@onready var follow: PathFollow2D = $PathFollow2D
@onready var start_point: Marker2D = $StartPoint
@onready var end_point: Marker2D = $EndPoint
@onready var locator: Marker2D = $Locator
@onready var area_2d: Area2D = $Locator/Area2D
@onready var current_grass = Node2D
@onready var grass_collection: Timer = $GrassCollection
@onready var fairy: Sprite2D = $PathFollow2D/Fairy
@onready var label: Label = $PathFollow2D/Fairy/Label



var collection_factor = 1
var moved = true
var current_pos = Vector2()
var speed = randf_range(2, 2)
var inventory = 0
var max_storage = 5

func get_current_position():
	current_pos = self.global_position
	set_start_point(current_pos)

func set_start_point(pos):
	path.curve.add_point(to_local(pos))
	print(pos)
	$LocatorTimeout.start()
	
func set_end_point(end_pos):
	path.curve.add_point(to_local(end_pos))
	fairy_flight()
	
func search_for_plant():
	locator.position.x += 1
	
func _ready() -> void:
	get_current_position()
	#var speed = randi_range(.3, 1)
	var rand_x = randi_range(0, 90)
	var rand_y = randi_range(0, -45)
	#follow.progress_ratio = 0
	#path.curve.add_point(Vector2(84, 120))
	#path.curve.add_point(Vector2(640, 392))
	path.curve.set_point_out(0, Vector2(rand_x, rand_y))
	#_flame_velocity()
	
func destroy():
	queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if follow.progress_ratio == 1:
		pass

func fairy_flight():
	#$Path2D/PathFollow2D/Firelantern.visible = true
	var tween = create_tween()
	tween.set_trans(Tween.TRANS_SINE)
	tween.tween_property(follow, "progress_ratio", 1, speed)
	tween.tween_callback(collect_material)

func collect_material():
	grass_collection.start()

func _on_locator_timeout_timeout() -> void:
	search_for_plant()

func _on_area_2d_connect_grass(sender, value) -> void:
	$LocatorTimeout.stop()
	sender.fairy_acknowledges_me()
	current_grass = sender
	if moved == true:
		locator.global_position.y = SignalBus.ground_position.y
		locator.position.y += value
		var end_pos = locator.global_position
		set_end_point(end_pos)
		moved = false
	
func reset():
	current_grass = null

func _on_grass_collection_timeout() -> void:
	if abs(current_grass.value) > 0:
		if inventory < max_storage:
			current_grass._collected(collection_factor)
			inventory += 1
			fairy.position.y += 1
			label.text = str(inventory) + "/5"
		else:
			inventory_full()
			grass_collection.stop()
	else:
		plant_fully_collected()
		grass_collection.stop()
	
func inventory_full():
	print("im fulllll!")
	
func plant_fully_collected():
	print("planted gone")
