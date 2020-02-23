extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var player = preload('res://scenes/Player.tscn')

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func spawn_player():
	yield(get_tree().create_timer(3), "timeout")
	var n_player = player.instance()
	get_tree().get_root().add_child(n_player)
	n_player.global_position = Vector2(500, 500)
	

func initiate_respawn(id):
	if id == 'protaganist':
		spawn_player()
		
		
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
