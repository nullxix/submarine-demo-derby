extends Panel

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var button_clicked = false
var calm_text = 'I\'m Okay'
var panic_text = 'HELP ME'

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Label")
	pass # Replace with function body.

#get_tree().call_group('group_name', 'function_name')
#add_to_group('group_name')
#var thing
# thing = Sprite.new() #new Sprite!
# add_child(thing) #thing is now one of my children 
# Called every frame. 'delta' is the elapsed time since the previous frame.
# thing.free() #'frees' the node (and it's kids) from the scene. Delete!
#func _process(delta):
#	pass


func _on_Button_pressed():
	button_clicked = !button_clicked
	var the_text = calm_text
	if button_clicked:
		the_text = panic_text
		
	get_node("Label").text = the_text
	pass # Replace with function body.


func _on_Bap_button_pressed():
	get_tree().call_group('baps','bap')
	pass # Replace with function body.
