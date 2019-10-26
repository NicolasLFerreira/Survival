extends Node2D

func _physics_process(delta):
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
	if Input.is_action_just_pressed("esc"):
		get_tree().quit()
	if Input.is_action_just_pressed("back"):
		get_tree().change_scene("res://main_menu.tscn")
	if Input.is_action_just_released("restart"):
		get_tree().reload_current_scene()
	