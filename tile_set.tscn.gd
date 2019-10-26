extends Node2D

export var spike = false

func _on_spikearea_area_entered(area):
	spike = true