extends Node3D

@export var speed: float = 1
@onready var timer = $Timer

var range: float = 2
var direction = Vector3.UP
var end_of_range: float
var start_of_range: float

func _ready():
	start_of_range = global_position.y + range
	end_of_range = global_position.y - range

func _process(delta):
	global_position += direction * delta * speed

	if global_position.y <= end_of_range or global_position.y >= start_of_range:
		direction = -direction

func _on_timer_timeout():
	queue_free()

func _on_area_3d_body_entered(body):
	if body.name != "player":
		return
	timer.start()
	$Area3D/CollisionShape3D.queue_free()
