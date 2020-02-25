extends KinematicBody2D

var speed = 100
var velocity = Vector2()
var Range = 50
const DAMAGE = 1
const TYPE = "ENEMY"


func _physics_process(delta):
	var World = get_parent()
	if World.has_node("Player"):
		var px = int(position.x)
		var py = int(position.y)
		var Player_x = get_parent().get_node("Player").position.x
		var Player_y = get_parent().get_node("Player").position.y
		
		if Player_x < px:
			velocity.x = -speed
			if Player_y < py+Range and Player_y > py-Range:
				velocity.y = 0 
				py = Player_y
				
		if Player_x > px:
			velocity.x = speed
			if Player_y < py+Range and Player_y < py+Range:
				velocity.y = 0
				py = Player_y 
			
		
		if Player_y < py:
			#$AnimationPlayer.play("Up")
			velocity.y = -speed
			if Player_x > px-Range and Player_x < px+Range:
				velocity.x = 0
				px = Player_x 
				
		if Player_y > py:
			#$AnimationPlayer.play("Down")
			velocity.y = speed
			if Player_x < px+Range and Player_x > px-Range:
				velocity.x = 0
			
	else:
		get_tree().change_scene("res://Scenes/Title Screen.tscn")
		

	
	move_and_slide(velocity)
	
