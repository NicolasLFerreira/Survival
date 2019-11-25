extends Node2D

func _on_quit_pressed():
	get_tree().quit()

func _on_back_pressed():
	get_tree().change_scene("res://main_menu.tscn")

func _on_pause_pressed():
    get_tree().paused = true
    $pause_pop.show()

func _on_unpause_pressed():
	get_tree().paused = false
	$pause_pop.hide()