extends Node2D

func _process(delta):
	if $Player.position.y>550:
		Vars.originScene="res://level_0.tscn"
		get_tree().change_scene_to_file("res://death_screen.tscn")
