extends Camera3D

@export var player: Node3D
var start_position: Vector3
var offset = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	start_position = global_position 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var new_pos = Vector3(start_position.x + offset, player.global_position.y + offset, player.global_position.z - offset)
	global_position = global_position.lerp(new_pos, .1)
