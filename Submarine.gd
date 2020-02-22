extends RigidBody2D
signal hit

class_name Submarine

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var speed = 1000
export var turn = 5000
export (float) var marx_factor = 0.01
export (float) var marx_factor_end = 0
export (float) var reverse_factor = -0.5
export (float) var rotation_speed = 500
export var hp_bar_size = 75
var up_force = Vector2()
var down_force = Vector2()
export (float) var hp = 20000
var max_hp

func update_hp_bar():
	var bar = get_node('../hp_bar')
	bar.update_hp_bar(hp/max_hp)

func update_hp_bar_good():
	var bar = get_node('../hp_bar')
	bar.update_hp_bar_good(hp/max_hp)
	

func start_force(which, factor):
	apply_impulse(Vector2(0,0), Vector2(0, speed * marx_factor * factor).rotated(rotation))
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

func heal_self(amt):
	hp = hp + amt
	update_hp_bar_good()
	
func take_damage(amt):
	var greatest_speed = max(up_force.length(), down_force.length())
	var damage = amt - (greatest_speed * 0.8) 
	hp = hp - damage
	update_hp_bar()
	print('hp remaining:', hp)
	
func attack(body):
	body.take_damage(max(up_force.length(), down_force.length()))
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	print('ready')
	max_hp = hp
	pass # Replace with function body.

func parse_groups(body):
	var _g = body.get_groups()
	if _g.count('vulnerable') > 0:
		attack(body)
	if _g.count('heal') > 0:
		heal_self(100)
		body.free()
	pass

func _on_Submarine_body_entered(body):
	parse_groups(body)
	emit_signal("hit")


func get_attacked():
	pass
