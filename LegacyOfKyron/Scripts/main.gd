extends Control

var OptSettings = {}
var mpos = Vector2()
var winBorder = OS.get_window_size()


func _ready():
	set_process(true)
	pass

func _process(delta):
	get_node("cursor").set_pos(get_viewport().get_mouse_pos())
	
	mpos = get_viewport().get_mouse_pos()
	#Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	#Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	#Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	

func _on_newBut_pressed():
	print("New Button Pressed")
	get_tree().change_scene("res://Levels/level1.scn")

func _on_optBut_pressed():
	print("Options Button Pressed")
	get_tree().change_scene("res://Options.scn")
	
func _on_quitBut_pressed():
	get_tree().quit()

