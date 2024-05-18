extends Node2D
class_name HitboxComponent

@export var health_component : HealthComponent

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func damage(attack: Attack):
	if health_component:
		health_component.damage(attack)
		get_parent().hit()
		#print("hitbox hit")
		
		#knockback
		if get_parent() is CharacterBody2D:
			var dir = attack.attack_vector.direction_to(global_position)
			#get_parent().velocity += dir*attack.knockback_force
			get_parent().knockback = dir*attack.knockback_force
		
	#if get_parent().get_parent().get_node("HitstopManager"):
		#get_parent().get_parent().get_node("HitstopManager").call("freeze_engine_default")
