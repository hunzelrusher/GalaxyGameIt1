class_name ShipStatsComponent
 
extends "res://components/stats_component.gd"

signal missle_enabled_signal()
signal fire_rate_updated()

@export var damage : int = 1 :
	set(value):
		if (value >= 10):
			value = 10
		damage = value

@export var firerate : float = 0.5:
	set(value):
		if(value >= 0.1):
			firerate = value
			fire_rate_updated.emit()
		
@export var lasers : int = 1:
	set(value):
		if(value >= 3):
			value = 3
		lasers = value

@export var laser_speed : int = 100:
	set(value):
		if (value >= 500):
			value = 500
		laser_speed = value
		
@export var missle_enabled : bool = false:
	set(value):
		if (missle_enabled != value):
			missle_enabled = value
			missle_enabled_signal.emit()
			
