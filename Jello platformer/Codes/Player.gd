extends CharacterBody2D

const Up = Vector2(0,-1)
const Gravity = 20
const Maxfallspeed = 400
const Maxspeed = 80
const Jumpforce = 400
const Accel = 10

var Jumped = true
var motion = Vector2()
var facingright = false

func _physics_process(_delta):
	
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
		$Sprite2D.scale.x = -1
	else:
		$Sprite2D.scale.x = 1
	
	
	
	if is_on_floor(): #plays the noise when you hit the ground. Maybe need to change the noise though
		if Jumped == true:
			$AnimationPlayer.play("walk")
			$Land.play()
			Jumped = false
		
		if Input.is_action_pressed("Up"): #Jump movement
			Jumped = true
			motion.y = -Jumpforce
			$Jump.play()
	
	if !is_on_floor():
		$AnimationPlayer.play("Jump") #makes the sprite stay in the jump frame till it's on the floor
	
	if Input.is_action_pressed("reset"):
		get_tree().reload_current_scene()
	
	set_velocity(motion)
	set_up_direction(Up)
	move_and_slide()
	motion = velocity
