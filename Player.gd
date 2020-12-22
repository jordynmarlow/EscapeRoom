extends KinematicBody2D

var MAX_SPEED = 250
onready var motion
onready var idle_anim = get_node("Sprite").get_node("idle_anim")

func _physics_process(delta):
	motion = Vector2.ZERO
	if int(Input.is_action_pressed("ui_left")) > 0:
		idle_anim.set_frame(2)
		motion.x -= 1
	elif int(Input.is_action_pressed("ui_right")) > 0:
		idle_anim.set_frame(0)
		motion.x += 1
	elif int(Input.is_action_pressed("ui_up")) > 0:
		idle_anim.set_frame(1)
		motion.y -= 1
	elif int(Input.is_action_pressed("ui_down")) > 0:
		idle_anim.set_frame(3)
		motion.y += 1
	motion = motion.normalized() * MAX_SPEED
	motion = move_and_slide(motion)
