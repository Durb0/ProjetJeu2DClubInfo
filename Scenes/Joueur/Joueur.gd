extends Node2D

var sens = 1
var m = 0.5
var vecteur = Vector2()
var bounce = -0.6
var dir
var ROTATION_SPEED = PI / 10
var rotate = 0
onready var sound = $bounce
onready var swipe = $swipe
onready var ball = $Ball
onready var arrow = $Arrow
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	position.y = PlayerData.y
	sens = PlayerData.sens
	vecteur = PlayerData.vecteur
	rotate = PlayerData.rotate
	ball.rotation = PlayerData.rotation
	swipe.volume_db = -30
	arrow.rotation = -PI/2

func _process(delta):
	vecteur.y += (m * Globals.gravity)* sens * delta
	arrow.rotation = vecteur.y /10 - PI/2
	if rotate > 0 :
		ball.rotation += ROTATION_SPEED
		rotate -= ROTATION_SPEED
	if ball.rotation >= 2*PI:
		ball.rotation -= 2*PI
	if ((position.y <= 32 and vecteur.y < 0) or (position.y >=get_viewport_rect().size.y - 32 and vecteur.y > 0)):
		vecteur.y *= bounce
		sound.volume_db = min(-20,(-60) + (abs(vecteur.y) * 10))
		if (abs(vecteur.y) >0.08):
			sound.play()
	position.y += vecteur.y
	
	
	
func _input(event):
	if Input.is_action_just_pressed("jump") and !event.is_echo() :
		sens = -sens
		rotate += PI
		swipe.play()
		return
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_HitBox_body_entered(body):
	if body.is_in_group("DeathTouch"):
		PlayerData.y = position.y
		PlayerData.sens = sens
		PlayerData.vecteur = vecteur
		PlayerData.rotate = rotate
		PlayerData.rotation = ball.rotation
		get_tree().change_scene("res://Scenes/Menu/Menu.tscn")
	elif body.is_in_group("Line"):
		Globals.score+=1
