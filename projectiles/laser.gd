extends Node2D

@onready var visible_on_screen_notifier_2d : VisibleOnScreenNotifier2D= $VisibleOnScreenNotifier2D
@onready var scale_component : ScaleComponent = $ScaleComponent as ScaleComponent
@onready var flash_component : FlashComponent = $FlashComponent as FlashComponent
@onready var hitbox_component : HitboxComponent = $HitboxComponent as HitboxComponent
@onready var move_component : MoveComponent = $MoveComponent as MoveComponent


# Called when the node enters the scene tree for the first time.
func _ready():
	scale_component.tween_scale()
	flash_component.flash()
	visible_on_screen_notifier_2d.screen_exited.connect(queue_free)
	hitbox_component.hit_hurtbox.connect(queue_free.unbind(1))

func set_damage(hitbox_damage : int) -> Node2D: 
	hitbox_component.damage = hitbox_damage
	return self
	
func set_speed(speed : int = 10) -> Node2D: 
	move_component.velocity.y = -1 * speed
	return self
