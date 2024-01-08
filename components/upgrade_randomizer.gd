class_name UpgradeRandomizer
extends Node

@export var upgrade_spawner_component : SpawnerComponent
@export var stats_component : StatsComponent
@export var upgrade_chance : int

# Called when the node enters the scene tree for the first time.
func _ready():
	stats_component.no_health.connect(func():
		if randi_range(0, (100 - upgrade_chance) / 10) == 0 : 
			upgrade_spawner_component.spawn()
	)
