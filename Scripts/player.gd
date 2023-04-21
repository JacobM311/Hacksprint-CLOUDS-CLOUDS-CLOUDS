extends RigidBody3D

@export var jump_height: float = 4
@export var speed: float = 2.3
@onready var ray1 = $RayCast1
@onready var ray2 = $RayCast2
@onready var ray3 = $RayCast3
@onready var ray4 = $RayCast4
@onready var ray5 = $RayCast5
@onready var ray6 = $RayCast6
@onready var ray7 = $RayCast7

# Called when the node en#ters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if global_position.y < -10:
		get_tree().reload_current_scene()
	


func _physics_process(delta):
	if Input.is_action_just_pressed("jump") and is_grounded() == true:
			apply_central_impulse(Vector3.UP * jump_height)
			
	if Input.is_action_pressed("right"):
		global_position.z -= delta * speed
			
	if Input.is_action_pressed("left"):
		global_position.z += delta * speed
			
	global_position.x = 0

func is_grounded():
	if ray1.is_colliding():
		return true
	if ray2.is_colliding():
		return true
	if ray3.is_colliding():
		return true
	if ray4.is_colliding():
		return true
	if ray5.is_colliding():
		return true
	if ray6.is_colliding():
		return true
	if ray7.is_colliding():
		return true
