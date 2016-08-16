extends RigidBody

# member variables here, example:
# var a=2
# var b="textvar"
var torso_ang = Vector3()
var skel
var cam
var mpos = Vector2()
var FacingDir = "none"
var newpose
var b

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	skel = get_node("Armature/Skeleton")
	cam = get_node("target/Camera")
	set_process(true)

##############
#Bone control#
##############
var bone = "torso"
var coordinate = 0
func set_bone_rot(bone, ang):
	mpos = get_viewport().get_mouse_pos()
	coordinate = get_node("2D_Systems/LookAt2D").get_rot()
	var b = skel.find_bone(bone)
	var rest = skel.get_bone_rest(b)
	var newpose = rest.rotated(Vector3(1.0, 0.0, 0.0), ang.x)
	skel.set_bone_pose(b, newpose)
		
	#b.set_rotation(look_at(mpos3, Vector3(0,1,0))

func _process(delta):
	torso_ang[0] = coordinate 
	set_bone_rot("torso", torso_ang)
	
	var center2D = get_node("2D_Systems/LookAt2D").get_pos()
	
	############################
	#Make Player Face Direction#
	############################
	if mpos[0] < center2D[0]:
		get_node("Armature/Skeleton").set_rotation_deg(Vector3(0, 0, 0))
		FacingDir = "Left"
		coordinate = sin(coordinate / 2) 
	elif mpos[0] > center2D[0]:
		get_node("Armature/Skeleton").set_rotation_deg(Vector3(0, 180, 0))
		FacingDir = "Right"
		coordinate = sin(coordinate / -2)
		
func _integrate_forces(state):
	
#########################
#Code from 3D Platformer#
#########################
#	var lv = state.get_linear_velocity() # Linear velocity
#	var g = state.get_total_gravity()
#	var delta = state.get_step()
#	var d = 1.0 - delta*state.get_total_density()
#	if (d < 0):
#		d = 0
#	lv += g*delta # Apply gravity
#########################
	
	###############
	#Movement code#
	###############
	if (Input.is_action_pressed("move_left")):
	#	print("move left")
		apply_impulse(Vector3(), Vector3(0, 0, 0.25))
	elif (Input.is_action_pressed("move_right")):
	#	print("move right")
		apply_impulse(Vector3(), Vector3(0, 0, -0.25))
		
	elif (Input.is_action_pressed("Jump")):
		if (state.get_contact_count() >= 1):
			apply_impulse(Vector3(), Vector3(0, 3.5, 0))
			
	elif (Input.is_action_pressed("GetDebugInfo")):
		print("Mouse Position at time of press: ", mpos)
		print("What direction are they facing: ", FacingDir)
		print("Rotation of 2D Node: ", coordinate)
		var Pose = skel.get_bone_pose(2)
		print("Pose: ", Pose)
	
func anim_callback(arg):
	#print(arg)
	pass
	