extends Attacker



export var speed = 400;
export var rumble_speed = 2000;
export var get_ready_to_rumble = 1
var rumble = false
export var life_cycle = 5
var rand = RandomNumberGenerator.new()

var forward_force = Vector2()

func spawn_bubble():
	Ator.spawn_bubble(get_global_position() - Vector2(0, -10).rotated(rotation), get_parent())
	
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
	spawn_bubble()
	spawn_bubble()
	spawn_bubble()
	self_destruct()
	_start_force(Vector2(speed, 0).rotated(rotation))

func RUMBLE():
	speed = rumble_speed

func _physics_process(delta):
	rand.randomize()
	var bubble_power = rand.randf_range(-1,10)
	if(bubble_power > 9.5):
		spawn_bubble()
		spawn_bubble()
	elif(bubble_power > 9):
		spawn_bubble()
		
	
	_end_force()
	_start_force(Vector2(speed, 0).rotated(rotation))
	if(!rumble):
		get_ready_to_rumble = get_ready_to_rumble - delta
		if(get_ready_to_rumble < 0):
			rumble = true
			spawn_bubble()
			spawn_bubble()
			spawn_bubble()
			spawn_bubble()
			RUMBLE()
	pass
	
# var b = "text"


# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
