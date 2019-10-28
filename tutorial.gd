extends Node2D

func _on_spikes1_body_entered(body):
	get_tree().reload_current_scene()

func _on_spikes2_body_entered(body):
	get_tree().reload_current_scene()