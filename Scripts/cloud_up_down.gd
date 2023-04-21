extends Node3D

@onready var movement_direction = Vector3.UP
@onready var timer = $Timer
@export var range: float = 2
var starting_pos = global_position.y
var end_of_range = starting_pos - range
var start_of_range = starting_pos + range

func _ready():
	pass

func _process(delta):
	global_position += movement_direction * delta
	if global_position.y >= start_of_range:
		movement_direction = -movement_direction
		global_position.y = start_of_range
	if global_position.y <= end_of_range:
		movement_direction = -movement_direction
		global_position.y = end_of_range

func _on_area_3d_area_entered():
	pass

func _on_timer_timeout():
	queue_free()

func _on_area_3d_body_entered(body):
	if body.name != "player":
		return
	timer.start()
	$Area3D/CollisionShape3D.queue_free()
