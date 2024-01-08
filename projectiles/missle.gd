extends Node2D

@onready var scale_component = $ScaleComponent
@onready var hitbox_component = $HitboxComponent
@onready var visible_on_screen_notifier_2d = $VisibleOnScreenNotifier2D
@onready var animation_player : AnimationPlayer = $AnimationPlayer as AnimationPlayer
@onready var spawner_component : SpawnerComponent = $SpawnerComponent

func _ready():
	hitbox_component.hit_hurtbox.connect(func(_hurtbox : HurtboxComponent):
		spawner_component.spawn()
		self.queue_free()
	)
	
	animation_player.play()
