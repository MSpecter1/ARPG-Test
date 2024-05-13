extends CharacterBody2D

@export var speed = 150
@export var friction = 1 #0.1
@export var acceleration = 1 #0.1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass

func get_input():
	var input = Vector2()
	if Input.is_action_pressed('move_right'):
		input.x += 1
	if Input.is_action_pressed('move_left'):
		input.x -= 1
	if Input.is_action_pressed('move_down'):
		input.y += 1
	if Input.is_action_pressed('move_up'):
		input.y -= 1
	return input

# Call 60 frames per second
func _physics_process(delta):
	var direction = get_input()
	if direction.length() > 0:
		velocity = velocity.lerp(direction.normalized() * speed, acceleration)
	else:
		velocity = velocity.lerp(Vector2.ZERO, friction)
		#$AnimatedSprite2D.animation = "idle"
		$AnimatedSprite2D.play("idle")
		
	if velocity.x or velocity.y != 0:
		$AnimatedSprite2D.play("walk_right")
		$AnimatedSprite2D.flip_h = velocity.x < 0
	
	move_and_slide()
