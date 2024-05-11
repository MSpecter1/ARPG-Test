extends RigidBody2D

var hp = 1000
var triangle_aoe_scene = preload("res://triangle_aoe.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func getTarget():
	var player_targets = get_tree().get_nodes_in_group("players")
	var closest_player
	for current in player_targets:
		#print(current.get_target_position())
		if !closest_player:
			closest_player = current
		elif self.global_position.distance_to(current.global_position)<self.global_position.distance_to(closest_player):
			closest_player = current
	return closest_player	

func _on_attack_timer_timeout():
	#print("test")
	var target = getTarget()
	#print(target.global_position)
	
	var triangle_aoe = triangle_aoe_scene.instantiate()
	triangle_aoe.visible = false
	add_child(triangle_aoe)
	triangle_aoe.global_position = self.global_position
	triangle_aoe.target = target
