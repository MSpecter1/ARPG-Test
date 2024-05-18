extends CharacterBody2D

@export var speed = 150
@export var friction = 1 #0.1
@export var acceleration = 1 #0.1
var knockback : Vector2
@export var knockback_resistance = 1
@export var hit_particle: PackedScene
var dead = false

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
		var move_vector = direction.normalized() * speed + knockback * knockback_resistance
		velocity = velocity.lerp(move_vector, acceleration)
	else:
		velocity = velocity.lerp(Vector2.ZERO, friction)
		velocity += knockback * knockback_resistance
		$AnimatedSprite2D.play("idle")
		
	if velocity.x or velocity.y != 0:
		$AnimatedSprite2D.play("walk_right")
		$AnimatedSprite2D.flip_h = velocity.x < 0
	
	move_and_slide()
	knockback = lerp(knockback, Vector2.ZERO,0.1)

func hit():
	pass
