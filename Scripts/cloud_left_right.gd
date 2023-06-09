extends Node3D

@onready var direction = Vector3.RIGHT
@onready var timer = $Timer
@export var range: float = 2

func _ready():
	pass

func _process(delta):
	global_position += direction * delta
	if global_position.x >= range:
		direction = -direction
	if global_position.x <= -range:
		direction = -direction

func _on_timer_timeout():
	queue_free()
	

func _on_area_3d_body_entered(body):
	if body.name != "player":
		return
	timer.start()
	$Area3D/CollisionShape3D.queue_free()
