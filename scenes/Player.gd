extends Submarine

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal booyah

var torpedo = preload('res://scenes/Torpedo.tscn')
var audio

func point():
	print('POINT')
	emit_signal("booyah")
# Called when the node enters the scene tree for the first time.
func fire_torpedo():
	var torpedo_i = torpedo.instance()
	var tube = get_node("TorpedoTube")
	get_parent().add_child(torpedo_i)
	Ator.spawn_bubble(tube.get_global_position(), get_parent())
	Ator.spawn_bubble(tube.get_global_position(), get_parent())
	Ator.spawn_bubble(tube.get_global_position(), get_parent())
	torpedo_i.global_position = tube.get_global_position()
	torpedo_i.rotation = rotation + 90
	$Pew.play()
func _ready():
	audio = get_node("AudioOut")
	Ator.register_player(self)
	apply_impulse(Vector2(0,0),Vector2(10, -50))
	pass
	
func use_special():
	fire_torpedo()
	
func up():
	var the_action = "ui_up"
	if Input.is_action_just_pressed(the_action):
		start_force(the_action, 1)
	if Input.is_action_just_pressed(the_action):
		update_force(the_action, 1)
	if Input.is_action_just_released(the_action):
		end_force(the_action, 1)
	
func down():
	var the_action = "ui_down"
	if Input.is_action_just_pressed(the_action):
		start_force(the_action, -0.75)
	if Input.is_action_just_pressed(the_action):
		update_force(the_action, -0.75)
	if Input.is_action_just_released(the_action):
		end_force(the_action, -0.75)
		
func left():
	var the_action = "ui_left"
	if Input.is_action_just_pressed(the_action):
		apply_torque_impulse(-turn * marx_factor)
		add_torque(-turn)
		
	if Input.is_action_just_released(the_action):
		apply_torque_impulse(turn * marx_factor)
		add_torque(turn)
		
	
func right():
	var the_action = "ui_right"
	if Input.is_action_just_pressed(the_action):
		apply_torque_impulse(turn * marx_factor)
		add_torque(turn)

	if Input.is_action_just_released(the_action):
		apply_torque_impulse(-turn * marx_factor)
		add_torque(-turn)

func space():
	var the_action ="ui_accept"
	if Input.is_action_just_pressed(the_action):
		use_special()

func get_input():
	up()
	down()
	left()
	right()
	space()

func _physics_process(delta):
	hp = hp + 1
	get_input()
