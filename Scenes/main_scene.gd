extends Node3D


func _enter_tree():
	if CheckPoint.last_position:
		$player.global_position = CheckPoint.last_position

func _on_area_3d_2_body_entered(body):
	if body.name != "player":
		return
	$AudioStreamPlayer3D.play()

func _on_audio_stream_player_3d_finished():
	get_tree().reload_current_scene()
