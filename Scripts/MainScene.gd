extends Node2D

var timerSpawn = 0.0
onready var canvas = $canvas
onready var invert = $DAWOOORLD
onready var note = $note
onready var lines = $Lines

func _ready():
	Globals.score = 0
	$AudioStreamPlayer.play()
	invert.visible = false
	GameData._ready()

func _process(delta):
	lines.modulate.a8 -= GameData.time
	note.position.x -= GameData.time
	if timerSpawn> GameData.spawn_rate:
		var obstacle = load("res://Scenes/pipes.tscn").instance()
		$SpawnPipes.add_child(obstacle)
		timerSpawn = 0.0
	get_node("Score").set_text(str(Globals.score))
	timerSpawn += delta # on suit le temps qui passe
	if(GameData.time >= GameData.startLvl3):
		invert.visible = false
	


func _input(_event):
	if Input.is_action_just_pressed("restart"):
		get_tree().reload_current_scene()
