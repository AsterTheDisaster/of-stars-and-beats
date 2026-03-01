extends Node2D





func _on_prize_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	get_tree().change_scene_to_file("res://win_screen.tscn")
