class_name EnemyDeathState
extends State

var actor: EnemyTemplate
var animator: AnimatedSprite2D

#func _ready():
	#print(actor.name)

func enter() -> void:
	set_physics_process(true)
	animator.play("dead")
	await animator.animation_finished
	actor.queue_free()

func exit() -> void:
	set_physics_process(false)
	
func _physics_process(delta):
	pass
