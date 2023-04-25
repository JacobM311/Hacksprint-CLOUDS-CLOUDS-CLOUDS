extends Control

@onready var cloud_hopper = $AudioStreamPlayer
@onready var timer_audio = $Timer3
# Called when the node enters the scene tree for the first time.
func _ready():
	timer_audio.start()
	$AnimationPlayer.play("Fade_in")
	$Timer.start()
	

func _on_timer_timeout():
	$AnimationPlayer.play("fade_out")
	$Timer2.start()
	

func _on_timer_2_timeout():
	get_tree().change_scene_to_file("res://Scenes/Main_Menu.tscn")


func _on_timer_3_timeout():
	cloud_hopper.play()
