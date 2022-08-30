extends Node2D

export var keys = 1
export var duration = 0.5
var state = "closed"
var timeout = 100.0

func _ready():
	$anim.play(state)
	$anim/keys.text = str(keys)

func _on_detect_body_entered(body):
	if body.is_in_group("player") and keys > 0:
		update_keys()

func _physics_process(delta):
	update_state(delta)

func update_keys():
	if MyConfig.keys < keys:
		return false
	MyConfig.keys = MyConfig.keys - keys 
	keys = 0	
	var level = get_parent().get_parent()
	level.update_keys(0)
	change_state("opening_1")
	$audio.play()

func update_state(delta):
	timeout -= delta
	if timeout > 0:
		return
	if state == "opening_2":
		change_state("opened")
		$body/shape.set_disabled(true)
	if state == "opening_1":
		change_state("opening_2")

func change_state(new_state):
	state = new_state
	timeout = duration 
	$anim.play(state)
	
