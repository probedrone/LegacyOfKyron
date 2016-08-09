extends Node

onready var OptSettings = {}

func _init():
	print(OptSettings)
	
	#Get File
	var opfile = File.new()
	if !opfile.file_exists("user://settings.ini"):
		print("File does not exist")
		OptSettings = {
		"DisRes": Vector2(800, 600),
		"Display_type": false,
		"Shadow_Quality": 2,
		"Model_Quality": 2,
		"Texture_Quality": 2,
		"AntiAliasing": true,
		"VerticalSync": false,
		"VoiceVol": 75,
		"SoundVol": 75,
		"MusicVol": 100,
		"CutsceneVol": 80,
		"Subtitles": false,
		}
		OS.set_window_size(OptSettings["DisRes"])
		OS.set_window_fullscreen(OptSettings["Display_type"])
		OS.set_use_vsync(OptSettings["VerticalSync"])
		OS.set_window_resizable(false)
		print(OptSettings)
		print(OptSettings["DisRes"])
	
func _ready():
	pass

func _process(delta):
#	OS.set_window_fullscreen(OptSettings["Display_type"])
#	OS.set_video_mode(Vector2(800, 600), OptSettings["Display_type"], false, 0)
	OS.set_window_resizable(false)
	var root = get_tree().get_root()
	var current_scene = root.get_child( root.get_child_count() -1 )