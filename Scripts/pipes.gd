extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var sens = 0 
onready var slide = $slide


# Called when the node enters the scene tree for the first time.
func _ready():
	position.y = Globals.rng.randf_range(-160.0,160.0)
	#sens = min(Globals.rng.randf_range(-GameData.time,GameData.time),200)
	if(GameData.time < 100):
		get_node("PipeDown").position.y += 50 - GameData.time/2;
		get_node("PipeUp").position.y -= 50 - GameData.time/2;
	slide.volume_db = min((-60) + abs(sens)/2,0.0)
	slide.play()

func _process(delta):
	position.x -= GameData.speed * delta
	if (position.y <= -160 and sens < 0) or (position.y >= 160 and sens >0):
		sens = sens * -1
	position.y += sens * delta
	if position.x < -2000:
		queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

