extends KinematicBody2D

const speed = 150
var movedir = Vector2(0,0)
const TYPE = "PLAYER"


func _physics_process(delta):
	controls_loop()
	move_loop()
func controls_loop():
	var Down = Input.is_action_pressed("ui_down")
	var Up = Input.is_action_pressed("ui_up") 
	var Left = Input.is_action_pressed("ui_left")
	var Right = Input.is_action_pressed("ui_right")
	movedir.x = -int(Left) + int(Right)
	movedir.y = -int(Up) + int(Down)
func move_loop():
	var motion = movedir.normalized()* speed
	move_and_slide(motion, Vector2(0,0))









