extends Camera3D

@export var player: Node3D
var start_position: Vector3

# Called when the node enters the scene tree for the first time.
func _ready():
	start_position = global_position 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var new_pos = Vector3(start_position.x, player.global_position.y, player.global_position.z)
	global_position = global_position.lerp(new_pos, .1)
