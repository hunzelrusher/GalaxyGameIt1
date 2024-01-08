class_name MoveInputComponent
extends Node

@export var move_stats: MoveStats
@export var move_component: MoveComponent

func _input(_event: InputEvent) -> void:
	var input_axis = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	move_component.velocity = Vector2(input_axis * move_stats.speed)
