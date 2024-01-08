class_name MissleExplosion

extends Node2D

@onready var animation_player : AnimationPlayer = $AnimationPlayer

func _ready():
	animation_player.animation_finished.connect(queue_free.unbind(1))
