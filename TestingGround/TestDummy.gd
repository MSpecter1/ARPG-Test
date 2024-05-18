extends StaticBody2D

@export var hit_particle: PackedScene
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func hit():
	#$AnimationPlayer.play("hit")
	#$HitParticle.particle_explode()
	var part = hit_particle.instantiate()
	add_child(part)
	part.emitting = true
	
