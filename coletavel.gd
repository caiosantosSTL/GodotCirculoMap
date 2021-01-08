extends Area



# Called when the node enters the scene tree for the first time.
func _ready():
	
	get_node("GiroCol").play("Girand")

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_coletavel_body_entered(body):
	if "Person" in body.name:
		get_node("CollisionShape").disabled = true
		get_node("kolekt").visible = false
		get_node("Partik3d").emitting = true
		#get_node("AudioStreamPlayer3D").play()
		get_node("TempKol").start()

	pass # Replace with function body.


func _on_TempKol_timeout():
	print("Temp foi")
	queue_free()
	pass # Replace with function body.
