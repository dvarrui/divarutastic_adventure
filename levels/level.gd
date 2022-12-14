extends Node2D

export var room_n = ""
export var room_s = ""
export var room_e = ""
export var room_w = ""

func _ready():
	init_music()
	update_keys(0)
	if MyConfig.position.x != -1:
		$player.position = MyConfig.position

func _process(delta):
	update_music(delta)
	if Input.is_action_just_pressed("game_menu"):
# warning-ignore:return_value_discarded
		get_tree().change_scene("res://levels/menu.tscn")

func init_music():
	$effects/music.play(MyConfig.music_time)
	
func update_music(delta):
	var audio_max = 205
	MyConfig.music_time += delta
	if MyConfig.music_time > audio_max:
		MyConfig.music_time -= audio_max
	
func update_keys(value):
	MyConfig.keys = MyConfig.keys + value
	$effects/keys.text = "Keys: " + str(MyConfig.keys)

func change_level(dir):
	if dir == "menu":
# warning-ignore:return_value_discarded
		get_tree().change_scene("res://levels/menu.tscn")

	var room_name = "res://levels/menu.tscn"
	var offset = 16
	if dir == "N":
		room_name = room_n
		MyConfig.position.y = MyConfig.screen_size().y - offset
	elif dir == "S":
		room_name = room_s
		MyConfig.position.y = offset
	elif dir == "E":
		room_name = room_e
		MyConfig.position.x = offset
	elif dir == "W":
		room_name = room_w
		MyConfig.position.x = MyConfig.screen_size().x -offset

	if room_name.length() == 0:
# warning-ignore:return_value_discarded
		get_tree().change_scene("res://levels/menu.tscn")
	else:
		print_debug("[DEBUG] ", MyConfig.room_name, " ", dir, "-> ", room_name)
		MyConfig.room_name = room_name
# warning-ignore:return_value_discarded
		get_tree().change_scene("res://levels/"+room_name+".tscn")
