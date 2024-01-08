class_name UpgradeEffekt
extends Node2D

var upgrade_text : String

@onready var label : Label = $Label
@onready var animation_player :AnimationPlayer = $AnimationPlayer as AnimationPlayer

func _ready():
	animation_player.animation_finished.connect(func(_animation_name : String):
		self.queue_free()
	)
	label.text = upgrade_text
	animation_player.play("upgrade_effekt")
	

