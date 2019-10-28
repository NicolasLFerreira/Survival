extends Node2D

var spike = false

func _on_spikearea_area_entered(area):
	spike = true