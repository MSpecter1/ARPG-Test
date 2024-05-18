extends CharacterBody2D
class_name EnemyTemplate

@export var max_speed = 25
@export var friction = 1 #0.1
@export var acceleration = 50 #0.1
@export var knockback_resistance = 1
@export var hit_particle: PackedScene
var dead = false
var knockback : Vector2

signal targeted_player
@onready var fsm = $FiniteStateMachine as FiniteStateMachine
@onready var enemy_wander_state = $FiniteStateMachine/EnemyWanderState as EnemyWanderState
@onready var enemy_chase_state = $FiniteStateMachine/EnemyChaseState as EnemyChaseState
@onready var sight_range = $SightRange

@onready var animator = $AnimatedSprite2D as AnimatedSprite2D
@onready var ray_cast_2d = $RayCast2D as RayCast2D

# Called when the node enters the scene tree for the first time.
func _ready():
	fsm.init(self, animator)

func _physics_process(delta):
	#ray_cast_2d.target_position = get_local_mouse_position()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#var chasing = false
	#if dead:
		#print("dead state")
		#$AnimatedSprite2D.play("dead")
		#await $AnimatedSprite2D.animation_finished
		#queue_free()
		#
	#elif chasing:
		#var target_dir = global_position.direction_to(getTarget().global_position).normalized()
		#velocity = target_dir * max_speed + knockback * knockback_resistance
		#$AnimatedSprite2D.play("walk")
	#else:
		#velocity = velocity.lerp(Vector2.ZERO, friction)
		#velocity += knockback * knockback_resistance
		#$AnimatedSprite2D.play("idle")
	#move_and_slide()
	knockback = lerp(knockback, Vector2.ZERO,0.1)


func hit():
	#$AnimationPlayer.play("hit")
	#$AnimatedSprite2D
	$AnimatedSprite2D.material.set_shader_parameter("active", true)
	$HitflashTimer.start()

	var part = hit_particle.instantiate()
	add_child(part)
	part.emitting = true

func _on_hitflash_timer_timeout():
	$AnimatedSprite2D.material.set_shader_parameter("active", false)

