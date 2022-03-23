extends Control
var t = Timer.new()

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var sound = $piano
onready var score = $Label_Score
onready var bestScore = $Label_BestScore
onready var player = $Joueur


# Called when the node enters the scene tree for the first time.
func _ready():
	Globals.piano = sound
	Globals.piano.play()
	if Globals.bestScore < Globals.score:
		Globals.bestScore = Globals.score
	Save.save_game()
	bestScore.set_text(str(Globals.bestScore))
	score.set_text(str(Globals.score))
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func change_scene():
	PlayerData.y = player.position.y
	PlayerData.sens = player.sens
	PlayerData.vecteur = player.vecteur
	PlayerData.rotate = player.rotate
	PlayerData.rotation = player.ball.rotation
	get_tree().change_scene("res://Scenes/MainScene/MainScene.tscn")

func _on_ButtonPlay_pressed():
	change_scene()


func _input(event):
	if Input.is_action_just_pressed("exit"):
		get_tree().quit()
	if Input.is_action_just_pressed("jump"):
			change_scene()
	


func _on_ButtonExit_pressed():
	get_tree().quit()
