extends ParallaxLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var offset_x=0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(_delta):
	set_motion_offset(Vector2(offset_x,0))
	offset_x-=8
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
