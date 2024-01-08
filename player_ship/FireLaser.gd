extends Node

@export var stats_component : ShipStatsComponent

@onready var fire_rate_timer = %FireRateTimer

@onready var left_muzzle = %LeftMuzzle
@onready var right_muzzle = %RightMuzzle
@onready var mid_muzzle = %MidMuzzle
@onready var laser_spawner_component = %LaserSpawnerComponent
@onready var scale_component = %ScaleComponent

@onready var variable_pitch_audio_stream_player = $"../VariablePitchAudioStreamPlayer"

func _ready():
	fire_rate_timer.start(stats_component.firerate)
	fire_rate_timer.timeout.connect(fire_lasers)

func fire_lasers() -> void:
	if (stats_component.lasers > 0):
		if (stats_component.lasers == 1):
			laser_spawner_component.spawn(mid_muzzle.global_position).set_damage(stats_component.damage).set_speed(stats_component.laser_speed)
		elif (stats_component.lasers > 1):
			laser_spawner_component.spawn(left_muzzle.global_position).set_damage(stats_component.damage).set_speed(stats_component.laser_speed)
			laser_spawner_component.spawn(right_muzzle.global_position).set_damage(stats_component.damage).set_speed(stats_component.laser_speed)
			
		variable_pitch_audio_stream_player.play_with_variance()
		scale_component.tween_scale()

func update_lasers():
	fire_rate_timer.start(stats_component.firerate)


func _on_stats_component_fire_rate_updated():
	update_lasers()
