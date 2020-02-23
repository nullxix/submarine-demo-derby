extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var normal_scale

# Called when the node enters the scene tree for the first time.
func _ready():
	normal_scale = scale
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_mouse_entered():
	scale = normal_scale * 1.1
	pass # Replace with function body.


func _on_Area2D_mouse_exited():
	scale = normal_scale
	pass # Replace with function body.
