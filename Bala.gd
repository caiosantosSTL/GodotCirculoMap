extends Area


var speed = 40
var velocity = Vector3()

func _ready():
	$Timer.start()
	pass # Replace with function body.

func start(xform):
	transform = xform
	velocity += transform.basis.z * speed
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	transform.origin += velocity * delta
	pass


func _on_Timer_timeout():
	
	queue_free()
	pass # Replace with function body.
