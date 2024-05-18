extends Node


@export var slow := 0.07
@export var time := 0.3


func _ready():
	pass

func freeze_engine_default():
	#print("hitstop default time")
	Engine.time_scale = slow
	await get_tree().create_timer(slow*time).timeout
	Engine.time_scale = 1

func freeze_engine(new_slow, new_time):
	Engine.time_scale = new_slow
	await get_tree().create_timer(new_slow*new_time).timeout
	Engine.time_scale = 1
