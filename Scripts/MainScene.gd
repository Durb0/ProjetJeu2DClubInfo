extends Node2D

var timer = 0.0
var spawn_rate = 2.0

func _ready():
	Globals.score = 0

func _process(delta):
	if timer> spawn_rate:
		var obstacle = load("res://Scenes/pipes.tscn").instance()
		$SpawnPipes.add_child(obstacle)
		timer = 0.0
	get_node("Score").set_text(str(Globals.score))
	timer += delta # on suit le temps qui passe
	
func _input(_event):
	if Input.is_action_just_pressed("restart"):
		get_tree().reload_current_scene()
