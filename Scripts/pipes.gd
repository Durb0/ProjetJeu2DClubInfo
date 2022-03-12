extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var speed=300.0
var sens


# Called when the node enters the scene tree for the first time.
func _ready():
	position.y = Globals.rng.randf_range(-160.0,160.0)
	sens = Globals.rng.randf_range(-100.0,100.0)

func _process(delta):
	position.x -= speed * delta
	if (position.y <= -160 and sens < 0) or (position.y >= 160 and sens >0):
		sens = sens * -1
	if Globals.score >=10:
		position.y += sens * delta
	if position.x < -2000:
		queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
