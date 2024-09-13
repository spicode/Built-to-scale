extends Node3D # Make sure it's Node3D for 3D scaling operations

@export var action_button_id = 15
var pickupobject = null

func _ready():
	var scale_factor = 0.5 # Set this to any value less than 1 to make the object smaller
	scale_object(scale_factor)

func scale_object(factor: float):
	# Set new scale by multiplying the current scale with the factor
	self.scale *= Vector3(factor, factor, factor)

# Scale the object when hit (factor is required)
func hit(factor: float):
	scale_object(factor)

# Called when the node enters the scene tree for the first time.
func _on_button_pressed(p_button):
	if p_button == action_button_id:
		if pickupobject and pickupobject.has_method("action"):  # Corrected 'has_methode'
			pickupobject.action()


		
