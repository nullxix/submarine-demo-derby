extends Node

class_name AtorInator
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var xplosion = preload("res://scenes/Explosion.tscn")
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func spawn_explosion(pos, parent, vary = true):
	var x_pos = pos
	if vary:
		rng.randomize()
		var randx = rng.randf_range(-10, 10)
		rng.randomize()
		var randy = rng.randf_range(-10, 10)
		x_pos = x_pos + Vector2(randx, randy)
	var x = xplosion.instance()
	parent.add_child(x)
	x.global_position = x_pos
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
