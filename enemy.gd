extends KinematicBody2D

var speed = Vector2.RIGHT * 1200
var inv = false

func _physics_process(delta):
	var col = move_and_collide(speed * delta)
	if col: 
		speed = -speed
		inv = not inv
		$e_sprite.flip_h = inv