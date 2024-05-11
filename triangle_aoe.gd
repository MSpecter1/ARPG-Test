extends Area2D

var target
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#self.global_position = target.global_position
	#var player_angle = self.global_position.direction_to(target.global_position).angle()
	self.look_at(target.global_position)


func _on_cast_timer_timeout():
	#$CollisionPolygon2D.disabled = false
	print("TRIANGLE AOE SNAPSHOT ACTIVE")
	checkHit()
	self.queue_free()


func checkHit():
	var overlapped_nodes = self.get_overlapping_areas()
	#print(overlapped_nodes)
	for body in overlapped_nodes:
		#print(body.name)
		if body in get_tree().get_nodes_in_group("players"):
			print(body.name+" got hit")


func _on_start_delay_timer_timeout():
	self.visible = true
	$CastTimer.start()
	
