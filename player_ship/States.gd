extends Node2D

@onready var laser_state : StateComponent = $LaserState
@onready var missle_state : StateComponent = $MissleState

@onready var fire_missles = $MissleState/FireMissles

@onready var missle_timer : Timer = %MissleTimer

# Called when the node enters the scene tree for the first time.
func _ready():
	for state in self.get_children():
		state = state as StateComponent
		state.disable()
		
	missle_timer.timeout.connect(missle_state.enable)
		
	missle_state.state_finished.connect(laser_state.enable)
	missle_state.enabled.connect(func():
		laser_state.disable()
		await get_tree().create_timer(0.8).timeout
		fire_missles.fire_missle()
		await get_tree().create_timer(1.5).timeout
		missle_state.disable()
		missle_state.state_finished.emit()
	)
	laser_state.enable()


func attach_missles():
	missle_timer.start()


func _on_stats_component_missle_enabled_signal():
	attach_missles()
