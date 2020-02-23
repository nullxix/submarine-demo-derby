extends Node

class_name AtorInator
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var xplosion = preload("res://scenes/Explosion.tscn")
var bubble = preload("res://scenes/Bubble.tscn")
var rng = RandomNumberGenerator.new()
var player
var player_registered = false
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

func get_player():
	if player_registered:
		return player
	else:
		return false

func register_player(p):
	player = p
	player_registered = true
	
func spawn_bubble(pos, parent, vary = true):
	var b_pos = pos
	if vary:
		rng.randomize()
		var randx = rng.randf_range(-10, 10)
		rng.randomize()
		var randy = rng.randf_range(-10, 10)
		b_pos = b_pos + Vector2(randx, randy)
	var b = bubble.instance()
	parent.add_child(b)
	b.global_position = b_pos

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
