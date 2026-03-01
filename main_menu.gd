extends Node2D



func _on_level_zero_button_pressed():
	get_tree().change_scene_to_file("res://level_0.tscn")


func _on_level_one_button_pressed():
	get_tree().change_scene_to_file("res://level_1.tscn")


func _on_info_button_pressed():
	$ColorRect.visible=true
	$RichTextLabel.visible=true

func _unhandled_input(event):
	if event.is_action_pressed("escape"):
		$ColorRect.visible=false
		$RichTextLabel.visible=false
