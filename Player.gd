extends KinematicBody2D

var MAX_SPEED = 250
var state = 'idle'
var dir = 'down'
onready var motion

func _process(delta):
	motion = Vector2.ZERO
	if int(Input.is_action_pressed("ui_left")) > 0:
		motion.x -= 1
		dir = 'left'
	elif int(Input.is_action_pressed("ui_right")) > 0:
		motion.x += 1
		dir = 'right'
	elif int(Input.is_action_pressed("ui_up")) > 0:
		motion.y -= 1
		dir = 'up'
	elif int(Input.is_action_pressed("ui_down")) > 0:
		motion.y += 1
		dir = 'down'
	if state == 'idle' and motion != Vector2.ZERO:
		state = 'run'
	elif state == 'run' and motion == Vector2.ZERO:
		state = 'idle'
	$Sprite.animation = state + '_' + dir
	motion = motion.normalized() * MAX_SPEED
	motion = move_and_slide(motion)

