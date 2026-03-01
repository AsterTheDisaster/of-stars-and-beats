extends Node2D

@export var bpm: float = 60
@export var deadspace: float = 0
var crochet: float
var song_position: float = 0
var beatnumber: int = 1
var lastbeat: float = 0
var beatcount: int = 0
var count: int = 1
var toggle: bool = false

func _init():
	crochet = 60/bpm
	pass

func _on_audio_stream_player_play_time(time):
	crochet = 60/bpm
	song_position=time
	if (song_position+deadspace>crochet+lastbeat):
		#print(song_position)
		lastbeat=lastbeat+crochet
		beatcount+=1
		
		if count==1:
			count=1
			print("offbeat")
			if toggle==false:
				toggle=true
				stop_collision_1.emit()
				start_collision_2.emit()
			else:
				toggle=false
				start_collision_1.emit()
				stop_collision_2.emit()
		else:
			count+=1
			print("beat")
			
		beat.emit()

func _process(delta):
	#print("Time to beat: ", (song_position-lastbeat))
	#print("Time from beat: ",(lastbeat-song_position))
	
	if Input.is_action_just_pressed("dash"):
		print(abs(get_time_from_beat()), abs(get_time_to_beat()))
		pass
	
	pass

func get_time_to_beat():
	return song_position-lastbeat

func get_time_from_beat():
	return lastbeat-song_position

signal beat

signal stop_collision_1
signal stop_collision_2
signal start_collision_1
signal start_collision_2
