extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var main

# Called when the node enters the scene tree for the first time.
func _ready():
	$oucher.play()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	main = load("res://scenes/Main.tscn")
	get_tree().change_scene_to(main)
	pass # Replace with function body.
