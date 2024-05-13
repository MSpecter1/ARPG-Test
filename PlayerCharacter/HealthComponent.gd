extends Node2D
class_name  HealthComponent
@export var MAX_HEALTH  := 100
var health : float

# Called when the node enters the scene tree for the first time.
func _ready():
	health = MAX_HEALTH
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func damage(attack: Attack):
	health -= attack.attack_damage
	if health <= 0:
		print(get_parent().name+" died")
		get_parent().queue_free()
