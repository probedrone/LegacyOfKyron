
extends Control

# member variables here, example:
# var a=2
# var b="textvar"

#var Settings = Global.OptSettings
var OptSettings = {}

func _init():
	print(OptSettings)
	var opfile = File.new()
	if !opfile.file_exists("user://settings.ini"):
		print("File does not exist")
		OptSettings = {
		"DisRes": Vector2(800, 600),
		"Disp_type": false,
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
		OS.set_window_fullscreen(OptSettings["Disp_type"])
		OS.set_use_vsync(OptSettings["VerticalSync"])
		OS.set_window_resizable(false)
		print(OptSettings)
		print(OptSettings["DisRes"])

func _ready():
	pass

func _on_ApplyBut_pressed():
	OS.set_window_size(OptSettings["DisRes"])
	OS.set_window_fullscreen(OptSettings["Disp_type"])
	OS.set_use_vsync(OptSettings["VerticalSync"])
	print("Applying Changes")
		
func _on_DisplayOpt_item_selected( ID ):
	if get_node("Graphics/DisplayOpt").get_selected_ID() == 0:
		OptSettings["Display_type"] = false
		print(OptSettings["Display_type"])
	elif get_node("Graphics/DisplayOpt").get_selected_ID() == 1:
		OptSettings["Display_type"] = true
		print(OptSettings["Display_type"])

func _on_ConfirmationDialog_confirmed():
	###########################################################################
	#If yes apply settings and save, if no then do not apply settings and save#
	###########################################################################
	pass # replace with function body


func _on_VoiceVol_value_changed( value ):
	pass # replace with function body


func _on_CutscnVol_value_changed( value ):
	pass # replace with function body


func _on_SfxVol_value_changed( value ):
	pass # replace with function body


func _on_MusicVol_value_changed( value ):
	pass # replace with function body

func _on_SubCheck_toggled( pressed ):
	pass # replace with function body


func _on_TextureQual_item_selected( ID ):
	##################################################
	#Note: Add Low Res, Medium Rex, High Res Textures#
	##################################################
	
	
	pass # replace with function body


func _on_ModelQual_item_selected( ID ):
	#############################################
	#NOTE: Add the High Poly and Mid Poly Meshes#
	#############################################
	pass # replace with function body


func _on_ShadowQual_item_selected( ID ):
	#########################
	#Sets the shadow quality#
	#########################
	
	########################################
	#Sets the quality if it is alrady there#
	########################################
	pass # replace with function body


func _on_DisplayRes_item_selected( ID ):
	var selRes = get_node("Graphics/DisplayRes").get_selected_ID()
	if selRes == 0:
		OptSettings["DisRes"] = Vector2(800, 600)
	elif selRes == 1:
		OptSettings["DisRes"] = Vector2(1024, 576)
	elif selRes == 2:
		OptSettings["DisRes"] = Vector2(1280, 720) 
	elif selRes == 3:
		OptSettings["DisRes"] = Vector2(1408, 792)
	print(selRes)
	print(OptSettings["DisRes"])


func _on_Vsync_pressed():
	var vs_toggled = get_node("Graphics/V-sync").is_pressed()
	if vs_toggled == true:
		OptSettings["VerticalSync"] = true
		print("Vertical Sync Enabled")
	elif vs_toggled == false:
		OptSettings["VerticalSync"] = false
		print("Vertical Sync Disabled")


func _on_BackBut_pressed():
	##############################################################################################
	#Check if any settings were changed.														 #
	#If no settings were changed display the window, will go for if they weren't applied as well.#
	#If settings were changed and saved let the player return to main menu.						 #
	##############################################################################################
	
	##############################
	#Settings Change Checker Code#
	##############################
	
	get_tree().change_scene("res://MainMenu.scn")

func _on_ConfirmationDialog_input_event( ev ):
	pass # replace with function body

