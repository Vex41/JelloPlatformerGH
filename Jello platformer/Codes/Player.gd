extends KinematicBody2D

const Up = Vector2(0,-1)
const Gravity = 20
const Maxfallspeed = 400
const Maxspeed = 80
const Jumpforce = 400
const Accel = 10

var Jumped = false
var motion = Vector2()
var facingright = false



func _physics_process(delta):
	
	motion.y += Gravity #Gravity handler
	if motion.y > Maxfallspeed:
		motion.y = Maxfallspeed
	
	
	
	motion.x = clamp(motion.x, -Maxspeed, Maxspeed) #Motion.x handler
	
	
	
	if Input.is_action_pressed("Right"): #Move right
		motion.x += Accel + 10
		facingright = true
		$AnimationPlayer.play("walk")
	
	if Input.is_action_pressed("Left"): #move left
		motion.x -= Accel
		facingright = false
		$AnimationPlayer.play("walk")
	
	else:
		motion.x = lerp(motion.x,0,0.2) #smoothens the movment
	
	
	
	if facingright == true: #changes which what the character is facing
		$Sprite.scale.x = -1
	else:
		$Sprite.scale.x = 1
	
	
	
	if is_on_floor(): #plays the noise when you hit the ground. Maybe need to change the noise though
		if Jumped == true:
			$Land.play()
			Jumped = false
		
		if Input.is_action_pressed("Up"): #Jump movement
			Jumped = true
			motion.y = -Jumpforce
			$Jump.play()
	
	motion = move_and_slide(motion, Up)


func _on_VisibilityNotifier2D_screen_exited():
	get_tree().reload_current_scene() #reset the world if fallen off the screen
