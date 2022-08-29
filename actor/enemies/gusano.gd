extends Area2D

export var speed = 50
export var x_min = -100
export var x_max = 100
export var direction = -1
var origin = Vector2.ZERO

func _ready():
	origin = position
	$anim.play("default")
	$anim.playing = true
	$anim.flip_h = false
	$anim.position.x = 3

func _on_enemy2_body_entered(body):
	if body.is_in_group("player"):
		body.game_over()

func _process(delta):
	var x_limit_max = origin.x + x_max
	if position.x > x_limit_max:
		position.x = x_limit_max 
		direction = -1
		$anim.flip_h = false
		$anim.position.x = 3

	var x_limit_min = origin.x + x_min
	if position.x < x_limit_min:
		position.x = x_limit_min
		direction = 1
		$anim.flip_h = true
		$anim.position.x = -3

	position.x += speed * direction * delta

