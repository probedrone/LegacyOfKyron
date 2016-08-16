
extends RayCast

# member variables here, example:
# var a=2
# var b="textvar"
onready var mouse_pos = Vector2(0, 0)

func _fixed_process(delta):
	mouse_pos = get_viewport().get_mouse_pos()
	get_node("target/camera/mouse")

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass


