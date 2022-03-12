extends Node2D

var sens = 1
var m = 0.5
var vecteur = 0
var bounce = 0.8
var dir
var ROTATION_SPEED = PI / 10
var rotate = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	position.y = Globals.y
	sens = Globals.sens
	vecteur = Globals.vecteur
	rotate = Globals.rotate
	rotation = Globals.rotation

func _process(delta):
	if rotate > 0 :
		rotation += ROTATION_SPEED
		rotate -= ROTATION_SPEED
	if rotation >= 2*PI:
		rotation -= 2*PI
	# si on sort du cadre.
	if (position.y >= (get_viewport_rect().size.y)-32 and vecteur > 0) or (position.y <= 32 and vecteur <0):
		vecteur = -vecteur * bounce
	else:
		position.y += vecteur
	vecteur += (m * Globals.gravity)* sens * delta
	

func _input(_event):
	if Input.is_action_just_pressed("jump"):
		sens = -sens
		rotate += PI
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_HitBox_body_entered(body):
	if body.is_in_group("DeathTouch"):
		Globals.y = position.y
		Globals.sens = sens
		Globals.vecteur = vecteur
		Globals.rotate = rotate
		Globals.rotation = rotation
		get_tree().change_scene("res://Scenes/Menu/Menu.tscn")
	elif body.is_in_group("Line"):
		Globals.score+=1
