extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if Globals.bestScore < Globals.score:
		Globals.bestScore = Globals.score
	Save.save_game()
	get_node("Label_BestScore").set_text(str(Globals.bestScore))
	get_node("Label_Score").set_text(str(Globals.score))


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func change_scene():
	Globals.y = get_node("Joueur").position.y
	Globals.sens = get_node("Joueur").sens
	Globals.vecteur = get_node("Joueur").vecteur
	Globals.rotate = get_node("Joueur").rotate
	Globals.rotation = get_node("Joueur").rotation
	get_tree().change_scene("res://Scenes/MainScene/MainScene.tscn")

func _on_ButtonPlay_pressed():
	change_scene()


func _input(event):
	if Input.is_action_just_pressed("jump"):
		change_scene()
