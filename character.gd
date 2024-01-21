extends CharacterBody2D

@onready var anim = $"main character"
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var actionable_finder: Area2D = $Marker2D/ActionableFinder
var inDialogue = false


func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		var actionables = actionable_finder.get_overlapping_areas()
		Global.NPC = actionables[0].name
		if actionables.size() > 0:
			Global.inDialogue = true
			actionables[0].action()
			return
		
	
func _process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	if Global.inDialogue == false:
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
	else:
		velocity.x = 0
		velocity.y = 0
		anim.play("idle")
	move_and_slide()
