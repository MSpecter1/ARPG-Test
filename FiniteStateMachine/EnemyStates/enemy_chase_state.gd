class_name EnemyChaseState
extends State

@export var actor: EnemyTemplate
@export var animator: AnimatedSprite2D
@export var vision_cast: RayCast2D
@onready var enemy_wander_state = $"../EnemyWanderState"

signal lost_player

func _ready() -> void:
	set_physics_process(false)

func enter() -> void:
	set_physics_process(true)
	animator.play("move")

func exit() -> void:
	set_physics_process(false)

func _physics_process(delta) -> void:
	animator.play("move")
	#var facing = sign(actor.velocity.x)
	#if facing == 0.0: facing = 1.0
	#animator.scale.x = facing
	
	var target = detectPlayers()
	if target:
		actor.ray_cast_2d.target_position = actor.ray_cast_2d.to_local(target.global_position)
		#if actor.ray_cast_2d.is_colliding(): print("BROKEN VISION")
		var angle = actor.global_position.angle_to_point(target.global_position)
		if abs(angle) > PI/2: animator.scale.x = -1
		else: animator.scale.x = 1
			
		#var direction = actor.global_position.direction_to(target.global_position)
		#actor.velocity = actor.velocity.move_toward(direction * actor.max_speed, actor.acceleration * delta)
		#actor.velocity += actor.knockback * actor.knockback_resistance
		
		var direction = actor.global_position.direction_to(target.global_position).normalized()
		actor.velocity = direction * actor.max_speed + actor.knockback * actor.knockback_resistance
		
		actor.move_and_slide()
	else:
		lost_player.emit()
		actor.fsm.change_state(enemy_wander_state)

func detectPlayers():
	var closest_target
	for target in actor.sight_range.get_overlapping_areas():
		if not closest_target or actor.position.distance_squared_to(closest_target)>actor.position.distance_squared_to(target.position):
			closest_target = target
	return closest_target
		
