extends KinematicBody

var gravity = -12  # strength of gravity Vector3.DOWN * 12
var speed = 15  # movement speed
var nedash = 15
var dash = 30
var act = 0
export var jump_speed = 9  # jump strength
var spin = 4  # rotation speed

var velocity = Vector3()
var jump = false

var rotvalor

var nopiso = false

var Bala = preload("res://Bala.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _unhandled_input(event):
	if event.is_action_pressed("tiro"):
		var b = Bala.instance()
		b.start($Instanci.global_transform)
		get_parent().add_child(b)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	#get_node("Mira/Camera").get_global_transform()

	velocity.x = 0
	velocity.z = 0
	
	#mover
	if Input.is_action_pressed("diant"):
		#velocity.z -= speed
		velocity += transform.basis.z * speed	
		#get_node("passoSom").play()
		
	if Input.is_action_pressed("dash"):
		speed = dash
		get_node("ParticlesPoera").emitting = true
		#get_node("coridaSom").play()
		
	
	if Input.is_action_pressed("nedash"):
		speed = nedash
		get_node("ParticlesPoera").emitting = false
		#get_node("coridaSom").stop()
			
			
		
	if Input.is_action_pressed("atras"):
		
		velocity += -transform.basis.z * speed
		#get_node("passoSom").play()
		
	if Input.is_action_pressed("gidir"):
		
		velocity += transform.basis.x * speed

	if Input.is_action_pressed("giesq"):
		
		velocity += -transform.basis.x * speed
	
	#girar para ver
	if Input.is_action_pressed("dir"):
		rotvalor = delta*-spin
		rotate_y(rotvalor)
		
	if Input.is_action_pressed("esq"):
		rotvalor = delta*spin
		rotate_y(rotvalor)				

	if Input.is_action_just_pressed("pular"):
		if nopiso == true:
			velocity.y = jump_speed	
	
	velocity.y += gravity * delta	
	velocity = move_and_slide(velocity, Vector3.UP)

	#se ta no chao
	if is_on_floor():
		nopiso = true
	else:
		nopiso = false
		
		
	pass
