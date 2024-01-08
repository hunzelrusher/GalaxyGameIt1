class_name Upgrade

extends Node2D

@onready var hurtbox_component : HurtboxComponent = $HurtboxComponent as HurtboxComponent

@export var effekt : PackedScene

var type = [1, 1, 2, 3, 4, 4, 4, 5].pick_random()

# Export and grab access to a spawner component so we can create an effect on death
@export var destroy_effect_spawner_component: SpawnerComponent
@onready var visible_on_screen_notifier_2d :VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D


func _ready() -> void:
	hurtbox_component.hurt.connect(destroy.unbind(1))
	visible_on_screen_notifier_2d.screen_exited.connect(queue_free)
	
func destroy() -> void:
	#var scene : UpgradeEffekt = destroy_effect_spawner_component.spawn(global_position, self)
	spawnAnimation()
	self.queue_free()

func spawnAnimation(global_spawn_position: Vector2 = global_position, parent: Node = get_tree().current_scene):
	# Instance the scene
	var instance = effekt.instantiate()
	
	match type:
		1 : instance.upgrade_text = "firereate up"
		2 : instance.upgrade_text = "damage up"
		3 : instance.upgrade_text = "more lasers"
		4 : instance.upgrade_text = "faster lasers"
		5 : instance.upgrade_text = "missle launcher"
	
	# Add it as a child of the parent
	parent.add_child(instance)
	# Update the global position of the instance.
	# (This must be done after adding it as a child)
	instance.global_position = global_spawn_position
