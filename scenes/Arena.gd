extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export (int) var low_enemy_count = 35
export (int) var high_enemy_count = 75

var shark = preload("res://scenes/Shark.tscn")
var knifeshark = preload("res://scenes/Shark.tscn")
var subsub = preload("res://scenes/SubSub.tscn")

var enemies
var spawners
var rng = RandomNumberGenerator.new()

func spawn(what, spa):
	var parpar = get_parent()
	var w = what.instance()
	parpar.add_child(w)
	w.global_position = spa.get_global_position()
	
func should_spawn_nemie():
	rng.randomize()
	if rng.randf_range(0,1) > 0.8:
		return true
	return false

func spawn_nemie(spa):
	rng.randomize()
	var rand = rng.randf_range(0,100)
	if rand > 50:
		spawn(shark, spa)
	elif rand > 15:
		spawn(knifeshark, spa)
	else:
		spawn(subsub, spa)
		

func spawn_enemies():
	var nemies_spawned = 0
	for spawner in spawners:
		if enemies.size() + nemies_spawned > high_enemy_count:
			return
		if should_spawn_nemie():
			spawn_nemie(spawner)
	pass
# Called when the node enters the scene tree for the first time.
func _ready():
	spawners = get_tree().get_nodes_in_group('spawner')
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	enemies = get_tree().get_nodes_in_group('enemy')
	if enemies.size() < low_enemy_count:
		spawn_enemies()
	pass
