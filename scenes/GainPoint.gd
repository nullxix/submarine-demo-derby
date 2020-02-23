extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var text_hold = 'Score: '
var score = 0
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Player_booyah():
	score = score + 300 + rng.randi_range(0,100)
	text = text_hold + str(score)
	pass # Replace with function body.
