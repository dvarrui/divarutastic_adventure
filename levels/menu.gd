extends Node2D

export var first_room = "level01"

func _ready():
	MyConfig.reset()
	$effects/music.playing = true
	
func _process(delta):
	if Input.is_action_just_pressed("game_new"):
		start_new_game()
	if Input.is_action_just_pressed("game_exit"):
		close_game()

func start_new_game():
	$effects/music.playing = false
	MyConfig.room_name = first_room
	get_tree().change_scene("res://levels/" + first_room + ".tscn")

func close_game():
	$effects/music.playing = false
	get_tree().quit()
