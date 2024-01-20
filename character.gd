extends CharacterBody2D

@onready var anim = $"main character"
const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if velocity.x >0:
		anim.flip_h = false
		anim.play("walk")
	elif velocity.x <0:
		anim.flip_h = true
		anim.play("walk")
	
	#Vertical movement (needs the speed to be changed a bit so it feels more realistic)
	if Input.is_action_pressed("up"):
		velocity.y = -SPEED * 0.9
		anim.play("walk")
	elif Input.is_action_pressed("down"):
		velocity.y = SPEED * 0.9
		anim.play("walk")
	else: 	
		velocity.y = 0
	if velocity.x ==0 && velocity.y ==0:
		anim.play("idle")
	
	move_and_slide()
