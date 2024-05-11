extends Node
@export var boss_scene: PackedScene
var score

# Called when the node enters the scene tree for the first time.
func _ready():
	#new_game()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func new_game():
	score = 0
	
	$Player.start($StartPosition.position)
	spawn_boss()
	$StartTimer.start()
	$HUD.update_score(score)
	$HUD.show_message("Get Ready")
	
func game_over():
	$ScoreTimer.stop()
	$HUD.show_game_over()

func _on_score_timer_timeout():
	score += 1
	$HUD.update_score(score)

func _on_start_timer_timeout():
	$ScoreTimer.start()
	
func spawn_boss():
	var boss = boss_scene.instantiate()
	boss.position = $BossStartPosition.position
	add_child(boss)

