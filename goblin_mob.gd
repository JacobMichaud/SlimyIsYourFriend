extends CharacterBody2D


const SPEED = 300.0
@onready var _mob = $AnimatedSprite2D
@onready var player = $"../Character"
@onready var goblin = _mob

func _physics_process(delta):
	
	if velocity.x and velocity.y == 0:
		goblin.play("Idle")
	
	if player != null && abs(goblin.position.x - player.position.x) < 100:
		velocity = global_position.direction_to(player.global_position ) * 200
		move_and_slide()
	else:
		goblin.play("idle")
	
	if player.position.x < goblin.position.x:
		goblin.flip_h = true
	else:
		goblin.flip_h = false
	
	#Movement
	if velocity.x == 0 && velocity.y == 0:
		_mob.play("Idle")
	
	if abs(_mob.global_position.x - player.global_position.x) < 70:
		_mob.play("Attack")
	if _mob.global_position.x - player.global_position.x < 0:
		_mob.flip_h = true
	elif _mob.global_position.x - player.global_position.x > 0:
		_mob.flip_h = false
	else:
		_mob.play("Idle")
	
	
