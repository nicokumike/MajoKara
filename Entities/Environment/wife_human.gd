extends CharacterBody2D

var speed: float = 10.0
var direction: Vector2 = Vector2.RIGHT
var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")
var gravity_scale = .3
const JUMP_VELOCITY = -20.0

@onready var ray_cast_2d: RayCast2D = $RayCast2D

func _ready() -> void:
	velocity = direction.normalized() * speed 

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * gravity_scale * delta
	var collider = ray_cast_2d.get_collider()
	if collider and collider.has_method("jumpnow"):
			velocity.y = JUMP_VELOCITY * 0.5
	move_and_slide()
