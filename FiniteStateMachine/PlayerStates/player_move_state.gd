class_name PlayerMoveState
extends State

@export var actor: Player
@export var animator: AnimatedSprite2D
@onready var player_idle_state = $"../PlayerIdleState"

func enter() -> void:
	set_physics_process(true)
	animator.play("walk_left")

func exit() -> void:
	set_physics_process(false)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _physics_process(delta):
	var direction = get_input()
	if direction.length() > 0:
		var move_vector = direction.normalized() * actor.speed + actor.knockback * actor.knockback_resistance
		actor.velocity = actor.velocity.lerp(move_vector, actor.acceleration)
	else:
		actor.fsm.change_state(player_idle_state)
		
	if actor.velocity.x or actor.velocity.y != 0:
		#animator.play("walk_right")
		animator.flip_h = actor.velocity.x < 0
	
	actor.move_and_slide()
	
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
