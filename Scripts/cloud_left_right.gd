extends Node3D

@onready var movement_direction = Vector3.RIGHT
@onready var timer = $Timer
@export var range: float = 2
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position += movement_direction * delta
	if global_position.x >= range:
		movement_direction = -movement_direction
	if global_position.x <= -range:
		movement_direction = -movement_direction

func _on_area_3d_area_entered():
	pass
	

func _on_timer_timeout():
	queue_free()
	

func _on_area_3d_body_entered(body):
	if body.name != "player":
		return
	timer.start()
	$Area3D/CollisionShape3D.queue_free()
