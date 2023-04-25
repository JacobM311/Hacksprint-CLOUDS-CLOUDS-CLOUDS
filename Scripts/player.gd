extends RigidBody3D

@export var jump_height: float = 0
@export var speed: float = 2.3
@onready var ray1 = $RayCast1
@onready var ray2 = $RayCast2
@onready var ray3 = $RayCast3
@onready var ray4 = $RayCast4
@onready var ray5 = $RayCast5
@onready var ray6 = $RayCast6
@onready var ray7 = $RayCast7
@export var dash_speed: float = 3
@onready var dash_time = $dash_timer
var can_dash: bool = true
@onready var jump_sound = $AudioStreamPlayer3D

func _process(delta):
	pass

func _physics_process(delta):
	rotation_degrees.y = 90
	
	if Input.is_action_just_pressed("jump") and is_grounded() == true:
		jump_sound.play()
		apply_impulse(Vector3.UP * jump_height)
		
	if Input.is_action_pressed("right") and Input.is_action_just_pressed("dash") and can_dash == true:
		can_dash = false
		apply_impulse(Vector3.FORWARD * dash_speed)
		dash_time.start()
		
	if Input.is_action_pressed("left") and Input.is_action_just_pressed("dash") and can_dash == true:
		can_dash = false
		apply_impulse(Vector3.BACK * dash_speed)
		dash_time.start()
		
	if Input.is_action_pressed("right"):
		global_position.z -= delta * speed
		
	if Input.is_action_pressed("left"):
		global_position.z += delta * speed
		
	global_position.x = 0
	
func _on_dash_timer_timeout():
	can_dash = true
	
func is_grounded():
	if ray1.is_colliding() or ray2.is_colliding() or ray3.is_colliding() or ray4.is_colliding() or ray5.is_colliding() or ray6.is_colliding() or ray7.is_colliding():
		return true
