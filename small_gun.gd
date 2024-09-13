extends "res://addons/godot-xr-tools/objects/pickable.gd"

var what_did_we_hit = null  # This will store the object that was hit

func fire():
	if $aim.is_colliding():
		what_did_we_hit = $aim.get_collider()  # Get the object that was hit
		if what_did_we_hit and what_did_we_hit.has_method("hit"):
			what_did_we_hit.hit($aim.get_collision_point())  # Call the hit method on the object

func _process(delta):
	if $aim.is_colliding():
		# Set the position of the aim's MeshInstance3D to the collision point
		$aim/MeshInstance3D.global_transform.origin = $aim.get_collision_point()
		$aim/MeshInstance3D.show()
	else:
		$aim/MeshInstance3D.hide()

	
