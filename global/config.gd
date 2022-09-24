extends Node

var music_time = 0
var keys = 0
var life = 2
var position = Vector2(-1, -1)
var room_name = "menu"
var history = {}

func _ready():
	pass # Replace with function body.

func reset():
	self.keys = 0
	self.position = Vector2(-1, -1)
	self.room_name = "menu"
	self.history = {}

func screen_size():
	var size = Vector2(1024, 600)
	return size
