extends Control

func _on_play_pressed():
	get_tree().change_scene("res://main_scene.tscn")

func _on_settings_pressed():
	get_tree().change_scene("res://settings.tscn")

func _on_quit_pressed():
	get_tree().quit()

func _physics_process(delta): 
	if Input.is_action_just_pressed("esc"):
		get_tree().quit()
	if Input.is_action_just_pressed("play"):
		get_tree().change_scene("res://main_scene.tscn")
	if Input.is_action_just_pressed("config"):
		get_tree().change_scene("res://settings.tscn")
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()