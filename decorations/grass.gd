extends Node2D

var toggle: bool = false

func _on_tempo_guide_beat():
	if toggle==false:
		toggle=true
		$Sprite.play("default")
	else:
		toggle=false
		$Sprite.play("new_animation")
