extends Node2D

@export var speed: float = -0.05
var toggle: bool = false

func _physics_process(delta):
	position.y=position.y+speed
	pass


func _on_tempo_guide_beat():
	if toggle==false:
		toggle=true
		$Sprite.play("default")
	else:
		toggle=false
		$Sprite.play("new_animation")


func _on_area_2d_body_entered(body):
	if body==$"../Player":
		Vars.originScene="res://level_1.tscn"
		get_tree().change_scene_to_file("res://death_screen.tscn")
