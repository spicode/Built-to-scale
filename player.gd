extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5
var player_height_ : float = 1.7 
# Get the gravity from the project settings to be synced with RigidDynamicBody nodes.
var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")
@onready var neck := $Neck
@onready var camera := $XROrigin3D/XRCamera3D


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= (gravity * delta)*2
		

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("left", "right", "forwards", "back")
	var direction = (neck.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()

	move_and_slide()
	
				
