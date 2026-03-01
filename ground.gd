extends TileMapLayer
var beattoggle:bool=false

func _on_tempo_guide_beat():
	if beattoggle:
		modulate=Color(1.0, 1.0, 1.0, 1.0)
		beattoggle=false
	else:
		beattoggle=true
		modulate=Color(0.77, 0.77, 0.77, 1.0)
