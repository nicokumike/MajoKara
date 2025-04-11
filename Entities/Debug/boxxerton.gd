extends Node2D

var start
var finish
var speed = 90
var rise = 20

func _ready() -> void:
	flight(0, 700)
	
func flight(pos1, pos2):
	start = pos1
	finish = pos2
	pass
	
func _process(delta: float) -> void:
	if self.position.x < finish:
		print("is moving")
		var progress = position.x / finish
		self.position.x += speed * delta
		if progress > 0.5:
			position.y += rise * delta
		else:
			position.y -= rise * delta
	pass
