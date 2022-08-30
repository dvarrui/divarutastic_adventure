extends Node2D

export var duration = 0.4
var state = "init"
var timeout = 100.0

func _ready():
	$anim.play(state)

func _on_detect_body_entered(body):
	if body.is_in_group("player") and state == "init":
		change_state("break_1")

func _physics_process(delta):
	update_state(delta)

func update_state(delta):
	timeout -= delta
	if timeout > 0:
		return
	if state == "break_2":
		change_state("break_3")
		$body/shape.set_disabled(true)
	if state == "break_1":
		change_state("break_2")

func change_state(new_state):
	state = new_state
	timeout = duration 
	$anim.play(state)
	
