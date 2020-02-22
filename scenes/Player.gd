extends Submarine

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var speed = 1000
export var turn = 5000
export (float) var marx_factor = 0.01
export (float) var marx_factor_end = 0
export (float) var reverse_factor = -0.5
export (float) var rotation_speed = 500
var velocity = Vector2()
var up_force = Vector2()
var down_force = Vector2()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func start_force(which, factor):
	apply_impulse(Vector2(0,0), Vector2(0, speed * marx_factor).rotated(rotation))
	var the_force = Vector2(0, speed * factor).rotated(rotation)
	
	if which == 'ui_up':
		up_force = the_force
	if which == 'ui_down':
		down_force = the_force
		
	add_force(Vector2(0,0), the_force)
	pass

func end_force(which, factor):
	var the_force = Vector2()
	
	if which == 'ui_up':
		the_force = up_force
	if which == 'ui_down':
		the_force = down_force
	add_force(Vector2(0,0), -1 * the_force)
	pass

func update_force(which, factor):
	end_force(which, factor)
	start_force(which, factor)
	pass	
	
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
		update_force(the_action, 1)
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

func get_input():
	up()
	down()
	left()
	right()

func _physics_process(delta):
	get_input()
