extends Area2D

var DAMAGE = 5
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var overlapped_nodes = self.get_overlapping_areas()
	#print(overlapped_nodes)
	for body in overlapped_nodes:
		if body is HitboxComponent:
			var attack = Attack.new()
			attack.attack_damage = DAMAGE
			attack.knockback_force = 0
			attack.attack_vector = global_position
			body.damage(attack)
			print(body.name+" got hit by test area")
