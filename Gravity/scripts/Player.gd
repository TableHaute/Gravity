extends KinematicBody2D

const GRAVITY = 5
const JUMP = 1
const SPEED = 75
onready var _animated_sprite = $AnimatedSprite

var velocity = Vector2.ZERO
func _ready():
	pass
	
	

func _physics_process(delta):
	
	velocity.x = 0
	if(Input.is_action_pressed("ui_left")):
		velocity.x = -SPEED
		_animated_sprite.play("walk")
		$AnimatedSprite.flip_h = false
	elif(Input.is_action_pressed("ui_right")):
		velocity.x = SPEED
		_animated_sprite.play("walk")
		$AnimatedSprite.flip_h = true
	
		print(velocity.x)
	if(Input.is_action_pressed("ui_up")):
			_animated_sprite.play("j")
	# See the note below about boolean assignment

	
	
	velocity.y += GRAVITY
	if velocity.y == 5:
		if(Input.is_action_just_pressed("ui_up")):
			velocity.y -=150
			
	

	velocity = move_and_slide(velocity)
