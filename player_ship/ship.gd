extends Node2D

@onready var fire_rate_timer: Timer = %FireRateTimer

@onready var animated_sprite_2d : AnimatedSprite2D = $Anker/AnimatedSprite2D as AnimatedSprite2D
@onready var flame_animated_sprite : AnimatedSprite2D = %FlameAnimatedSprite as AnimatedSprite2D
@onready var move_component : MoveComponent = $MoveComponent as MoveComponent

@onready var upgrade_hitbox_component : HitboxComponent = $UpgradeHitboxComponent as HitboxComponent
@onready var blink_component : BlinkComponent = $BlinkComponent as BlinkComponent
@onready var stats_component : ShipStatsComponent = $StatsComponent as ShipStatsComponent

@onready var fire_laser = $States/LaserState/FireLaser
@onready var states = $States

# Called when the node enters the scene tree for the first time.
func _ready():
	
	upgrade_hitbox_component.hit_hurtbox.connect(func(hurtbox : HurtboxComponent):
		match hurtbox.get_parent().type:
			1 : stats_component.firerate = stats_component.firerate / 1.2
			2 : stats_component.damage += 1
			3 : stats_component.lasers += 1
			4 : stats_component.laser_speed += 50
			5 : stats_component.missle_enabled = true
			
		blink_component.blink()

	)
	
func _process(_delta):
	animate_the_ship()
	
func animate_the_ship() -> void:
	if move_component.velocity.x < 0:
		animated_sprite_2d.play("bank_left")
		flame_animated_sprite.play("bank_left")
	elif move_component.velocity.x > 0:
		animated_sprite_2d.play("bank_right")
		flame_animated_sprite.play("bank_right")
	else:
		animated_sprite_2d.play("center")
		flame_animated_sprite.play("center")
