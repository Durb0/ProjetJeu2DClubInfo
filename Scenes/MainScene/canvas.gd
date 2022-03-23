extends CanvasModulate


var countLvl1 = 0
var countLvl3 = 0
var countLvl4 = 0

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	if(GameData.time <=GameData.duringLvl1): #NIVEAU 1
		countLvl1 += 100/GameData.duringLvl1 * delta *2
		color.g8 = 100 - int(countLvl1)
		color.b8 = 100 - int(countLvl1)
	elif(GameData.time > GameData.duringLvl1 and GameData.time < GameData.startLvl3): #NIVEAU 2 
		color.r8 = 0         
		color.g8 = 0
		color.b8 = 0
	elif(GameData.time > GameData.startLvl3 and GameData.time < GameData.startLvl4): #NIVEAU 3
		countLvl3 += 100/GameData.duringLvl3 * delta
		color.r8 = int(countLvl3)
		color.g8 = int(countLvl3)
		color.b8 = int(countLvl3)
	elif(GameData.time > GameData.startLvl4 and GameData.time < GameData.startLvl5):
		countLvl4 += 100/GameData.duringLvl4 * delta
		color.r8 = 200 - int(countLvl4)
		color.g8 = int(countLvl4)
		color.b8 = int(countLvl4)
	else:
		color.r8 = 100        
		color.g8 = 100
		color.b8 = 100
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
