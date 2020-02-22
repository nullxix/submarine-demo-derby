extends RigidBody2D
signal hit

class_name Submarine

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Submarine_body_entered(body):
	print('I BEEN HIT BY YA MAMA')
	print(body)
	emit_signal("hit")
