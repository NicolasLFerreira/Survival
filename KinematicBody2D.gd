extends KinematicBody2D

#Physics

var vector = Vector2()
var g = 30

#Movement

var spd = 300
var spd_m = 700
var spd_s = 115
var spd_sm = 1000
var jp_f = 1

#Stamina control

var stm = 100
var stm_r = 1
var stm_l = 2

#Power

var power = 0

#Bools

var shift = false
var jp = false
var power_t = false

#Input

var jump = false
var left = false
var right = false

#Op

var g_zero = false
var op = false
var slow = false
var s = 1
var sm = 1

func _process(delta):
	if (right and vector.y <= 30) or (left and vector.y <= 30):
		$player_sprite.play("run")
	else:
		$player_sprite.play("idle")
	
	$player_camera/status/statusbox/stm_label.set_text("Stamina: " + str(stm))
	
	$player_camera/status/statusbox/power_level.set_text("Power Level: " + str(power))
	

func getinput():
	jump = Input.is_action_pressed("jump")
	left = Input.is_action_pressed("left")
	right = Input.is_action_pressed("right")
	shift = Input.is_action_pressed("shift")
	g_zero = Input.is_action_pressed("g_zero")
	op = Input.is_action_pressed("op")
	slow = Input.is_action_pressed("slow")
	
	#Walking and Running
	
	if left:
		vector.x = max(vector.x-spd, -spd_m)
		$player_sprite.flip_h = true
	elif right:
		vector.x = min(vector.x+spd, +spd_m)
		$player_sprite.flip_h = false
	else:
		vector.x = 0
	
	#Jumping
	
	if is_on_floor() and jump and stm >= 5:
		vector.y = jp_f
		if jp:
			stm -= 5
	
	#stm
	
	if shift and stm >= 1:
		spd = spd_s
		spd_m = spd_sm
		jp_f = -1000
		jp = true
	else:
		spd = sm
		spd_m = 750
		jp_f = -775
		jp = false
	
	if power == 100 and Input.is_action_pressed("power"):
		vector.y = -750
		power = 0
	
	#Op
	
	if g_zero:
		g = 0
	else:
		g = 30
	
	if op:
		vector.y = jp_f
	
	if slow:
		s = 1
		sm = 1
	else:
		s = 300
		sm = 700

func _physics_process(delta):
	
	getinput()
	
	vector = move_and_slide(vector, Vector2(0, -1))
	if not is_on_floor():
		vector.y += g

func _on_powergen_timeout():
	if power < 100:
		power += 10
	

func _on_stmregen_timeout():
	if (!left or !right) and stm < 100:
		if !shift:
			stm += stm_r
	else:
		pass

func _on_stmloss_timeout():
	
	if (left or right) and stm > 1:
		if shift:
			stm -= stm_l