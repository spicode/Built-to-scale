extends Node3D

var ray_length = 10.0  # The range of the gun
var shrink_factor = 0.9  # How much to shrink the object on each hit

func _ready():
	# Add necessary initialization code here
	pass

func _process(delta):
	if Input.is_action_just_pressed("shoot"):
		fire_ray()

func fire_ray():
	# Get the position and direction of the gun
	var from = global_transform.origin
	var to = from + -global_transform.basis.z * ray_length

	# Perform the raycast
	var space_state = get_world_3d().direct_space_state
	var result = space_state.intersect_ray(from, to)

	if result:
		var hit_object = result.collider
		if hit_object and hit_object.has_method("set_scale"):
			shrink_object(hit_object)

func shrink_object(obj):
	var current_scale = obj.scale
	obj.scale = current_scale * shrink_factor
