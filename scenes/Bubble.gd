extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var sprite
var life_cycle
var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func self_destruct():
	yield(get_tree().create_timer(life_cycle), "timeout")
	queue_free()
	
	
func _ready():
	rng.randomize()
	life_cycle = rng.randf_range(0.1,1) + rng.randf_range(0.1,6)
	rng.randomize()
	sprite = get_node("Sprite")
	var size = rng.randf_range(0.01, 0.03)
	sprite.scale = Vector2(size, size)
	sprite.rotate(rng.randf_range(-6, 6))
	rng.randomize()
	var fx = rng.randf_range(-2,2)
	var fy = rng.randf_range(-2,2)
	var b_force = Vector2(fx, fy)
	add_force(Vector2(0,0), b_force)
	rng.randomize()
	var t = rng.randf_range(-0.5,0.5)
	add_torque(t)
	self_destruct()


# Called every fraprinte. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	rng.randomize()
	var should_i = rng.randf_range(-1,1)
	if(should_i > 0.9):
		var fx = rng.randf_range(-0.2,0.2)
		var fy = rng.randf_range(-0.2,0.2)
		var b_force = Vector2(fx, fy)
		apply_impulse(Vector2(0,0), b_force)
	pass
