extends Node2D

func _on_quit_pressed():
	get_tree().quit()

func _on_back_pressed():
	get_tree().change_scene("res://main_menu.tscn")