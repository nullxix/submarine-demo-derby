extends Submarine

# Called when the node enters the scene tree for the first time.

var rng = RandomNumberGenerator.new()
var force = Vector2(0, 0)
var torque = 0
var _speed = 400
var moving = false
var turning = false

func _start_force(f):
	force = f
	add_force(Vector2(0,0), f)

func _end_force():
	add_force(Vector2(0,0), -force)

func _start_torque(t):
	torque = t
	add_torque(t)
	
func _end_torque():
	add_torque(-torque)

func the_thing():
	pass
	#_start_torque(get_inertia()*12)
	
func turn(dir = 'right'):
	if turning:
		return
		
	turning = true
	var h = 4000
	if dir == 'left':
		h = -4000
	_start_torque(h)
	yield(get_tree().create_timer(0.2), "timeout")
	_end_torque()
	turning = false

func boost(dur):
	if moving:
		return
		
	moving = true
	rng.randomize()
	var b_f = Vector2(0, _speed + rng.randf_range(0, _speed))
	_start_force(b_f.rotated(rotation))
	yield(get_tree().create_timer(dur), "timeout")
	_end_force()
	moving = false

func _ready():
	pass
	#_start_force(Vector2(0, _speed).rotated(rotation))

func _physics_process(delta):
	rng.randomize()
	var shall_we_dance = rng.randf_range(0,100)
	if shall_we_dance > 98:
		boost(rng.randf_range(0.5,10))
	if shall_we_dance < 4:
		var u = rng.randf_range(0,1)
		if u > 0.5:
			turn('left')
		else:
			turn('right')
	#get_inertia() * (diff 
	#_end_force()
	#_start_force( Vector2(0, _speed).rotated(rotation) )
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
