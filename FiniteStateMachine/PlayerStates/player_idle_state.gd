class_name PlayerIdleState
extends State

@export var actor: Player
@export var animator: AnimatedSprite2D

@onready var player_move_state = $"../PlayerMoveState" as PlayerMoveState

func enter() -> void:
	set_physics_process(true)
	animator.play("idle")

func exit() -> void:
	set_physics_process(false)
	
func _physics_process(delta):
	actor.velocity = actor.velocity.lerp(Vector2.ZERO, actor.friction)
	actor.velocity += actor.knockback * actor.knockback_resistance
	process_input()
	
func process_input():
	if Input.is_action_pressed('move_right') or Input.is_action_pressed('move_left') or Input.is_action_pressed('move_down') or Input.is_action_pressed('move_up'):
		actor.fsm.change_state(player_move_state)
		
	
