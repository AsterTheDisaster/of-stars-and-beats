extends Node2D

var finished: bool = false

func _on_ragequit_pressed():
	get_tree().change_scene_to_file("res://main_menu.tscn")


func _on_retry_button_pressed():
	get_tree().change_scene_to_file(Vars.originScene)
