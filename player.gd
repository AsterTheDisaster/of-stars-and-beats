extends CharacterBody2D

var inputs_not_held: bool = false
var beat_toggle: bool = false
var coyote_timer: float = true
var totaltime: float = true
var ijumpheight: int =350
var ijumpstop: int = 100
var ispeed: int = 10
var itopspeed: int = 150
var igravspeed: int = 14
var itopgrav: int = 500
var defaultBPM: float = 60.0



func _physics_process(delta):
	var factor = $"../TempoGuide".bpm/defaultBPM
	var speed=ispeed*factor
	var topspeed=itopspeed*factor
	var gravspeed=igravspeed*factor
	var topgrav=itopgrav*factor
	var jumpheight=ijumpheight*factor
	var jumpstop=ijumpstop*factor
		
	
	if Input.is_action_pressed("left"):
		if velocity.x>-speed*3:
			velocity.x=-speed*3
		velocity.x-=speed
		inputs_not_held=false
	if Input.is_action_pressed("right"):
		if velocity.x<speed*3:
			velocity.x=speed*3
		velocity.x+=speed
		inputs_not_held=false
	
	totaltime+=delta
	
	if is_on_floor():
		coyote_timer=totaltime
	
	if Input.is_action_just_pressed("jump"):
		if is_on_floor() or totaltime-coyote_timer<0.08:
			print(totaltime-coyote_timer)
			jump(jumpheight)

	if Input.is_action_just_released("jump"):
		stop_jump(jumpstop)
	
	if not (Input.is_action_pressed("right") or Input.is_action_pressed("left")):
		inputs_not_held=true
	
	
	
	if inputs_not_held:
		if velocity.x>2*speed:
			velocity.x-=speed
		elif velocity.x<-(2*speed):
			velocity.x+=speed
		else:
			velocity.x=0
		
	
	if not is_on_floor():
		velocity.y += gravspeed
		velocity.y = min(velocity.y, topgrav)
	if is_on_floor():
		velocity.y = min(velocity.y, 0)
	if velocity.x>0:
		velocity.x=min(velocity.x, topspeed)
	if velocity.x<0:
		velocity.x=max(velocity.x, -topspeed)
	move_and_slide()
	
	
	pass


func _on_tempo_guide_beat():
	if beat_toggle:
		beat_toggle=false
		$AnimatedSprite2D.play("default_beat")
	else:
		beat_toggle=true
		$AnimatedSprite2D.play("default")

func jump(jumpheight):
	velocity.y-=jumpheight

func stop_jump(jumpstop):
	if velocity.y<-jumpstop and velocity.y<0:
		velocity.y+=jumpstop
