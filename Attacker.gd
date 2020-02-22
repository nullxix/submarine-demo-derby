extends RigidBody2D

class_name Attacker

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var attack_power = 2000
export var base_attack_power = 2000

func attack(body, damage):
	var body_groups = body.get_groups()
	if body_groups.count('vulnerable') > 0:
		body.take_damage(damage)
	print('DOIN MAMA DAMAGE')

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Attacker_body_entered(body):
	print('I see somethin')
	attack(body, attack_power)
	pass # Replace with function body.
