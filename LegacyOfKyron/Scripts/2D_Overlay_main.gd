
extends Node2D

# member variables here, example:
# var a=2
# var b="textvar"
var mpos = Vector2()

func _ready():
	mpos = get_viewport().get_mouse_pos()
	set_process(true)
		
	
func _process(delta):
	get_node("Target reticule").set_pos(get_viewport().get_mouse_pos())


