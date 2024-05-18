extends Area2D

@export var damage = 20
@export var knockback = 150
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
#	Use below for polling constant input held
	#if Input.is_action_pressed('skill_1'):
		#look_at(get_global_mouse_position())
		#$AnimationPlayer.play("Swing")

func _input(event):
	if event.is_action_pressed('skill_1'):
		look_at(get_global_mouse_position())
		$AnimationPlayer.play("Swing")

#func _on_animation_player_animation_finished(anim_name):
	#$AnimationPlayer.stop()

#func _on_body_entered(body):
	#print(body.name)
	#if body is HitboxComponent:
		#var attack = Attack.new()
		#attack.attack_damage = 20
		#body.damage(attack)
		#print(body.name+" got hit")

func _on_area_entered(area):
	#print(area.name)
	if area is HitboxComponent:
		var attack = Attack.new()
		attack.attack_damage = damage
		attack.knockback_force = knockback
		#attack.attack_position = global_position
		attack.attack_vector = global_position
		area.damage(attack)
		print(area.get_parent().name+" got hit by "+ name)
