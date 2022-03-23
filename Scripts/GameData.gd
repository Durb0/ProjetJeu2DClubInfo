extends Node
var time =0
var speed=400.0
var duringLvl1 = 75
var duringLvl2 = 71
var duringLvl3 = 65
var duringLvl4 = 34

var startLvl3 = duringLvl1 + duringLvl2
var startLvl4 = startLvl3 + duringLvl3
var startLvl5 = startLvl4 + duringLvl4

var spawn_rate = 0.95*1.5


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	time = 0
	speed =400

func _process(delta):
	if(time < duringLvl1):
		speed +=delta
	elif(time > startLvl4 and time < startLvl5):
		speed += delta
	else:
		speed = 400
	time += delta
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
