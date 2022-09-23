extends Area2D

export var speed = 50
export var x_min = -100
export var x_max = 100
export var y_min = -100
export var y_max = 100
export var direction = -1
export var mode = "x"
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
	if self.mode == "x":
		update_mode_x(delta)
	if self.mode == "y":
		update_mode_y(delta)

func update_mode_x(delta):
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

func update_mode_y(delta):
	var y_limit_max = origin.y + y_max
	if position.y > y_limit_max:
		position.y = y_limit_max 
		direction = -1

	var y_limit_min = origin.y + y_min
	if position.y < y_limit_min:
		position.y = y_limit_min
		direction = 1

	position.y += speed * direction * delta

