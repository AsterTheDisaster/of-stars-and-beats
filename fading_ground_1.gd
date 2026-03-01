extends TileMapLayer
var beattoggle: bool=false

func _on_tempo_guide_start_collision_1():
	modulate=Color(1,1,1,1)
	enabled=true


func _on_tempo_guide_stop_collision_1():
	modulate=Color(0.27, 0.27, 0.27, 1.0)
	await get_tree().create_timer(0.08).timeout
	enabled=false
