extends Node2D

export var room_n = ""
export var room_s = ""
export var room_e = ""
export var room_w = ""

func _ready():
	get_node("effects/music").playing = true
	update_keys(0)
	if MyConfig.position.x != -1:
		$player.position = MyConfig.position

func _process(delta):
	if Input.is_action_just_pressed("game_menu"):
		get_tree().change_scene("res://levels/menu.tscn")

func update_keys(value):
	MyConfig.keys = MyConfig.keys + value
	$effects/keys.text = "Keys: " + str(MyConfig.keys)

func change_level(dir):
	print("[DEBUG.1] change_level to dir ", dir)
	if dir == "menu":
		get_tree().change_scene("res://levels/menu.tscn")

	var room_name = "res://levels/menu.tscn"
	var offset = 8
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
		
	print("[DEBUG.2] change_level to room_name ", room_name)
	if room_name.length() == 0:
		get_tree().change_scene("res://levels/menu.tscn")
	else:
		get_tree().change_scene("res://levels/"+room_name+".tscn")

