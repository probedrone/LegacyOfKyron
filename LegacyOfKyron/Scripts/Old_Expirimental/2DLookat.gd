
extends Position2D

# member variables here, example:
# var a=2
# var b="textvar"


func _process(delta):
	var mpos = get_viewport().get_mouse_pos()
	look_at(mpos)
	
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)
