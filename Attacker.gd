extends RigidBody2D

class_name Attacker

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var attack_power = 2000
export var base_attack_power = 2000
var Ator = AtorInator.new()

func spawn_explosion(body):
	var x_spot
	var enemy_spot = body.get_global_position()
	var u_spot = get_global_position()
	x_spot = (enemy_spot + u_spot) / 2
	Ator.spawn_explosion(x_spot, get_parent())
	
func attack(body, damage):
	var body_groups = body.get_groups()
	if body_groups.count('vulnerable') > 0:
		body.take_damage(damage)
		spawn_explosion(body)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Attacker_body_entered(body):
	attack(body, attack_power)
	pass # Replace with function body.
