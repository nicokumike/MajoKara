extends Node2D
@onready var ray_cast_2d: RayCast2D = $RayCast2D

func no_plants_found():
	pass

func _physics_process(_delta: float) -> void:
	if ray_cast_2d.is_colliding() == true:
		var obj = ray_cast_2d.get_collider()
		if obj.has_method("restart_search"):
			obj.restart_search()
