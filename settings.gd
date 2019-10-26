extends Control

func _on_back_pressed():
	get_tree().change_scene("res://main_menu.tscn")

func _on_max_pressed():
	OS.set_window_size(Vector2(1920,1080))

func _on_min_pressed():
	OS.set_window_size(Vector2(1024,600))

func _on_full_pressed():
	OS.window_fullscreen = true

func _on_window_pressed():
	OS.window_fullscreen = false
