extends KinematicBody2D

#Physics

var vector = Vector2()
var g = 30

#Movement

var spd = 300
var spd_m = 700
var spd_s = 115
var spd_sm = 1150
var jp_f = 1
var stm = 100

#Stamina control

var stm_r = 1
var stm_cap = 100
var stm_l = 1

#power

var power = 0


#bools

var shift = false
var jp = false
var power_t = false

func _process(delta):
	if Input.is_action_pressed("right") and vector.y <= 30 or Input.is_action_pressed("left") and vector.y <= 30:
		$player_sprite.play("run")
	else:
		$player_sprite.play("idle")
	
	$player_camera/status/statusbox/stm_label.set_text("Stamina: " + str(stm))
	
	$player_camera/status/statusbox/power_level.set_text("Power Level: " + str(power))
	
func getinput():
	#Walking and Running
	if Input.is_action_pressed("left"):
		vector.x = max(vector.x-spd, -spd_m)
		$player_sprite.flip_h = true
		
	elif Input.is_action_pressed("right"):
		vector.x = min(vector.x+spd, +spd_m)
		$player_sprite.flip_h = false
	else:
		vector.x = 0
	
	if Input.is_action_pressed("op"):
		vector.y = -400
	
	#Jumping
	
	if is_on_floor() and Input.is_action_pressed("jump") and stm > 10:
		vector.y = jp_f
		if jp == true:
			stm -= 10
	#stm
	
	if Input.is_action_pressed("sprint") and stm >= 1:
		spd = spd_s
		spd_m = spd_sm
		jp_f = -950
		jp = true
		shift = true
	else:
		spd = 125
		spd_m = 750
		jp_f = -820
		jp = false
		shift = false
	
	
	if power == 100 and Input.is_action_pressed("power"):
		vector.y = -925
		power = 0
	

func _physics_process(delta):
	
	getinput()
	
	vector = move_and_slide(vector, Vector2(0, -1))
	if not is_on_floor():
		vector.y += g

func _on_stmregen_timeout():
	
	if  stm < stm_cap and shift == false and not Input.is_action_pressed("right") or stm < stm_cap and shift == false and not Input.is_action_pressed("left") or stm < stm_cap and shift == false and not Input.is_action_pressed("jump"):
		stm += stm_r
	
	if not Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
		stm_l = 0
	elif shift == true and Input.is_action_pressed("left") or shift == true and Input.is_action_pressed("right") or shift == true and Input.is_action_pressed("jump"):
		stm_l = 1

func _on_stmloss_timeout():
	if stm > 0:
		stm -= stm_l

func _on_powergen_timeout():
	if power < 100:
		power += 10