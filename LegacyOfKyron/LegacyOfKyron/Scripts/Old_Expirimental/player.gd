extends RigidBody

# member variables here, example:
# var a=2
# var b="textvar"
var torso_ang = Vector3()
var skel
var cam
var tPlane = Plane(1,0,0,5)
onready var mpos = Vector2(0, 0)
var tc = TestCube.new()
var FacingDir = "none"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	skel = get_node("Armature/Skeleton")
	cam = get_node("target/Camera")
	add_child(tc)
	set_process(true)

#Current track bone to mouse code
func set_bone_rot(bone, ang):
	
	####################
	#Get Mouse Position#
	####################
	var mpos = get_viewport().get_mouse_pos()
	var cFrom = cam.project_ray_origin(mpos)
	var cNormal = cam.project_ray_normal(mpos)
	
	###################################################
	#This chunk of code gets the second mouse position#
	###################################################
	var mpos3 = tPlane.intersects_ray(cFrom,cNormal)
	var b = skel.find_bone("torso")
	var rest = skel.get_bone_global_pose(b)
	var bone_base = skel.get_bone_rest(b)

	#################################################################
	#This area is for setting the look at rotation of the torso bone#
	#################################################################
	var newpose = rest.looking_at(Vector3(0,mpos3[0],mpos3[1]),Vector3(0,0,1))#rest.basis.y))
	var t = tc.get_global_transform()
	t.origin = mpos3
	tc.set_global_transform(t)
	#var newpose = rest.rotated(Vector3(1.0, 0.0, 0.0), PI/180)
	skel.set_bone_global_pose(b, newpose)
	
	var CharPos = get_node(".").get_translation()
	
	if mpos3[0] < CharPos[2]:
		get_node("Armature/Skeleton").set_rotation(Vector3(0, 180, 9))
		FacingDir = "Left"
	elif mpos3[0] > CharPos[2]:
		get_node("Armature/Skeleton").set_rotation(Vector3(0, 0, 0))
		FacingDir = "Right"
	
	######################################################
	#Debugging Information Retrieval(Completely Optional)#
	######################################################
	if (Input.is_action_pressed("GetDebugInfo")):
		print("Start of debug block")
		print("Second Mouse Positions: ", mpos3)
		print("First Mouse Position: ",mpos)
		print("Character Location: ", get_node(".").get_translation())
		print("Character Rotation: ", get_node("Armature/Skeleton").get_rotation())
		print("Rest Position: ", rest)
		print("Torso point: ", torso_ang.y)
		print(FacingDir)
		print("End of debug block")
		
	#b.set_rotation(look_at(mpos3, Vector3(0,1,0))

func _process(delta):
	set_bone_rot(null, 0)
	
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
	if (Input.is_action_pressed("Jump")):
		if (state.get_contact_count() >= 1):
			apply_impulse(Vector3(), Vector3(0, 3.5, 0))
	
func anim_callback(arg):
	#print(arg)
	pass
	