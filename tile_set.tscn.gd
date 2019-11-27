extends Node2D

func _on_cu_body_entered(body):
	get_tree().reload_current_scene()