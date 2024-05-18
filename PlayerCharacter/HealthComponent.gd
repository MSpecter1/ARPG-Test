extends Node2D
class_name  HealthComponent
@export var MAX_HEALTH  := 100
var health : float
signal dead
@export var animated_sprite : AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	health = MAX_HEALTH
	$HPBar.value = health
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func damage(attack: Attack):
	health -= attack.attack_damage
	$HPBar.value = health
	if health <= 0:
		#emit_signal("dead")
		#print(get_parent().name+" died")
		get_parent().dead = true
		#get_parent().get_node("AnimatedSprite2D").play("dead")


#func _on_death_finished(name):
	#if name == "dead":
		#get_parent().queue_free()
