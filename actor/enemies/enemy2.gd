extends Area2D

export var speed = 200
export var x_min = -100
export var x_max = 100
export var direction = 1
var origin = Vector2.ZERO
var shape_offset = 5

func _ready():
	origin = position
	$anim.play("default")
	$anim.playing = true

func _on_enemy2_body_entered(body):
	if body.is_in_group("player"):
		body.game_over()

func _process(delta):
	position.x += speed * direction * delta
	$anim.flip_h = false
	$shape.position.x = shape_offset * direction
	if direction > 0:
		$anim.flip_h = true
	if position.x > (origin.x+x_max) or position.x < (origin.x+x_min):
		direction = direction * (-1)
