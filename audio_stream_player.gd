extends AudioStreamPlayer

func _process(delta):
	play_time.emit(get_playback_position())
	pass
	
signal play_time
