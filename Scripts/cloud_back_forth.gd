extends Node3D

var range: float = 2
var direction = Vector3.FORWARD
var end_of_range: float
var start_of_range: float
@export var speed: float = 1
@onready var timer = $Timer
# Called when the node enters the scene tree for the first time.
func _ready():
	start_of_range = global_position.z + range
	end_of_range = global_position.z - range

func _process(delta):
	global_position += direction * delta * speed

	if global_position.z <= end_of_range or global_position.z >= start_of_range:
		direction = -direction
	
func _on_timer_timeout():
	queue_free()
	
func _on_area_3d_body_entered(body):
	if body.name != "player":
		return
	timer.start()
	$Area3D/CollisionShape3D.queue_free()
	print("titties")
