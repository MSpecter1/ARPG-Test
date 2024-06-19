class_name FiniteStateMachine
extends Node
@export var state: State
var actor
@onready var enemy_death_state = $EnemyDeathState

func init(parent, animator: AnimatedSprite2D) -> void:
	actor = parent
	for child in get_children():
		child.actor = parent
		child.animator = animator
		child.set_physics_process(false)	
	# Initialize to the default state
	change_state(state)

# Called when the node enters the scene tree for the first time.
#func _ready():
	#change_state(state)
	#pass # Replace with function body.

func change_state(new_state: State):
	#print(actor, " changes to ",new_state)
	if state is State:
		state.exit()
	state = new_state
	new_state.enter()	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if actor.dead:
		change_state(enemy_death_state)
	pass
