extends Node2D

@export var stats_component : ShipStatsComponent

@onready var missle_spawner_component = %MissleSpawnerComponent
@onready var missle_marker = %MissleMarker


func fire_missle() -> void:
	missle_spawner_component.spawn(missle_marker.global_position)
	
