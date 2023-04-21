extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Fade_in")
	$Timer.start()
	

func _on_timer_timeout():
	$AnimationPlayer.play("fade_out")
	$Timer2.start()
	


func _on_timer_2_timeout():
	get_tree().change_scene_to_file("res://Scenes/MAIN.tscn")
