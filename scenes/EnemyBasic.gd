extends Submarine


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var player
# Called when the node enters the scene tree for the first time.
func _ready():
	player = Ator.get_player()
	pass # Replace with function body.

func _physics_process(delta):
	if player:
		pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
