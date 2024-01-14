extends CharacterBody2D

@onready var anim = $"main character"
const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func _process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	#Vertical movement (needs the speed to be changed a bit so it feels more realistic)
	if Input.is_action_pressed("ui_up"):
		velocity.y = -SPEED * 0.9
	elif Input.is_action_pressed("ui_down"):
		velocity.y = SPEED * 0.9
	else: 
		anim.play("default")
		velocity.y = 0
	
	move_and_slide()
