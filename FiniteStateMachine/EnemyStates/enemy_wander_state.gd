class_name EnemyWanderState
extends State

@export var actor: EnemyTemplate
@export var animator: AnimatedSprite2D
@export var vision_cast: RayCast2D
@onready var enemy_chase_state = $"../EnemyChaseState"

signal found_player

func enter() -> void:
	set_physics_process(true)
	animator.play("idle")

func exit() -> void:
	set_physics_process(false)
	
func _physics_process(delta):
	#animator.scale.x = sign(actor.velocity.x)
	#if animator.scale.x == 0.0: animator.scale.x = 1.0
	#
	#actor.velocity = actor.velocity.move_toward(actor.velocity.normalized() * actor.max_speed, actor.acceleration * delta)
	#var collision = actor.move_and_collide(actor.velocity * delta)
	#if collision:
		#var bounce_velocity = actor.velocity.bounce(collision.get_normal())
		#actor.velocity = bounce_velocity
	#if not vision_cast.is_colliding():
		#found_player.emit()

	var target = detectPlayers()
	if target:
		actor.ray_cast_2d.target_position = actor.ray_cast_2d.to_local(target.global_position)
		if actor.ray_cast_2d.is_colliding():
			var collision = actor.ray_cast_2d.get_collider()
			if collision in get_tree().get_nodes_in_group("players"):
				print(target.get_parent().name+" was detected")
				found_player.emit()
				actor.fsm.change_state(enemy_chase_state)

func detectPlayers():
	var closest_target
	for target in actor.sight_range.get_overlapping_areas():
		if not closest_target or actor.position.distance_squared_to(closest_target)>actor.position.distance_squared_to(target.position):
			closest_target = target
	return closest_target
