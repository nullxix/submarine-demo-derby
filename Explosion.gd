extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var sprite
var grow_time = 0.3
var shrink_time = 0.3
var max_size = 0.1
var start_size = 0
var g_direction = "grow"
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func self_destruct():
	queue_free()
	
func grow(delta):
	var current_scale = sprite.scale.x
	var next_scale = current_scale + delta * ((max_size - start_size) / grow_time)
	sprite.scale.x = next_scale
	sprite.scale.y = next_scale
	
func shrink(delta):
	var current_scale = sprite.scale.x
	var next_scale = current_scale + delta * ((start_size - max_size) / shrink_time)
	sprite.scale.x = next_scale
	sprite.scale.y = next_scale
	if sprite.scale.x <= start_size:
		self_destruct()
	
func _ready():
	rng.randomize()
	grow_time = grow_time + rng.randf_range(-0.05, 0.15)
	rng.randomize()
	shrink_time = shrink_time + rng.randf_range(-0.05, 0.15)
	rng.randomize()
	max_size = max_size + rng.randf_range(-0.07, 0.07)
	rng.randomize()
	sprite = get_node("Sprite")
	sprite.scale = Vector2(start_size, start_size)
	sprite.rotate(rng.randf_range(-6, 6))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if sprite.scale.x >= max_size:
		g_direction = "shrink"
	if g_direction == "shrink":
		shrink(delta)
	else:
		grow(delta)
