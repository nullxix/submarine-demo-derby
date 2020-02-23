extends Attacker



export var speed = 400;
export var rumble_speed = 2000;
export var get_ready_to_rumble = 1
export var life_cycle = 5

var forward_force = Vector2()

func _start_force(vector):
	forward_force = vector
	add_force(Vector2(0,0), vector)
	
func _end_force():
	add_force(Vector2(0,0), -1 * forward_force)
	pass
	
func self_destruct():
	yield(get_tree().create_timer(life_cycle), "timeout")
	queue_free()
	
func _ready():
	#apply_impulse( Vector2(0,0), Vector2(speed / 10, launch_speed).rotated(rotation))	
	self_destruct()
	_start_force(Vector2(speed, 0).rotated(rotation))

func RUMBLE():
	speed = rumble_speed

func _physics_process(delta):
	_end_force()
	_start_force(Vector2(speed, 0).rotated(rotation))
	get_ready_to_rumble = get_ready_to_rumble - delta
	if(get_ready_to_rumble <= 0):
		RUMBLE()
	pass
	
# var b = "text"


# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
