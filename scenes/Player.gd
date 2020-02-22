extends Submarine

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
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

func get_input():
	up()
	down()
	left()
	right()

func _physics_process(delta):
	get_input()
