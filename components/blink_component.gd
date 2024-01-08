# Give the component a class name so it can be instanced as a custom node
class_name BlinkComponent
extends Node

# The flash component uses a flash material. I chose to preload this into a constant
# But you could also export a material instead to allow the component to use a variety
# of different materials
const FLASH_MATERIAL = preload("res://effects/white_flash_material.tres")

# Export the sprite this compononet will be flashing
@export var sprite: CanvasItem

# Export a duration for the flash
@export var blink_duration: float = 1
@export var flash_duration: float = 0.2

var count_blinks: int

# We need to store the original sprite's material so we can reset it after the flash
var original_sprite_material: Material

# Create a timer for the flash component to use
var timer: Timer = Timer.new()

func _ready() -> void:
	# We have to add the timer as a child of this component in order to use it
	add_child(timer)
	
	count_blinks = round(blink_duration / flash_duration / 2)
	
	# Store the original sprite material
	original_sprite_material = sprite.material

func blink():
	for n in count_blinks:
		sprite.material = FLASH_MATERIAL
		timer.start(flash_duration)
		await timer.timeout
		sprite.material = original_sprite_material
		timer.start(flash_duration)
		await timer.timeout
		
