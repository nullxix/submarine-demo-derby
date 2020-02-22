extends ColorRect

var full_size
var time_to_decrement = 0
var time_to_increment = 0
var normal_color
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var mother_name = '../Submarine'
export var offset = Vector2(-20,-10)
export var hurt_color = Color(0.9, 0.2, 0.2, 1)
export var good_color = Color(0.92, 0.76, 0.07, 1)
# Called when the node enters the scene tree for the first time.
func _ready():
	normal_color = color
	full_size = rect_size.x
	pass # Replace with function body.

func update_hp_bar(amount):
	rect_size.x = full_size * amount
	decrement_hp_bar()
	pass

func update_hp_bar_good(amount):
	rect_size.x = full_size * amount
	increment_hp_bar()
	
func increment_hp_bar():
	time_to_decrement = 0.3
	color = good_color
	
func decrement_hp_bar():
	time_to_decrement = 0.3
	color = hurt_color
	pass
	
func continue_decrement_animation(delta):
	time_to_decrement = time_to_decrement - delta
	if time_to_decrement <= 0:
		color = normal_color
		

func _physics_process(delta):
	var mother = get_node(mother_name)
	rect_position = mother.position + offset
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if time_to_decrement > 0:
		continue_decrement_animation(delta)
