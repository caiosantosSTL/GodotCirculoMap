extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_node("Platforms/platformo/AnimationPlayer").play("Animov1")
	get_node("Platforms/platformo2/AnimationPlayer").play("Animov2")
	get_node("Platforms/platformo3/AnimationPlayer").play("Animov3")
	pass




func _on_Pulapul_body_entered(body):
	if "Person" in body.name:
		print("oi")
		get_node("Person").jump_speed = 18

		
	pass # Replace with function body.
	
	


func _on_Pulapul_body_exited(body):
	if "Person" in body.name:
		print("oioi")
		get_node("Person").jump_speed = 9
		get_node("Person/AnimaRotation").play("PulaRotar")
		get_node("Person/AnimaRotation").current_animation = "PularRotar"
	pass # Replace with function body.
