extends Node2D

var vulnerable = true #makes it so tha you don't lose ALL your health instantly
var health = 6

func _on_Timer_timeout(): #makes the player vulnerable to damage
	vulnerable = true
	print("vulnerable")
	print(health)

func _on_Area2D_area_entered(_area):
	if vulnerable == true:
		health = health - 1
		$Timer.start()
		vulnerable = false
	if health == 6:
		$Heart1.set_frame(0)
		$Heart2.set_frame(0)
		$Heart3.set_frame(0)
	if health == 5:
		$Heart1.set_frame(1)
		$Heart2.set_frame(0)
		$Heart3.set_frame(0)
	if health == 4:
		$Heart1.set_frame(2)
		$Heart2.set_frame(0)
		$Heart3.set_frame(0)
	if health == 3:
		$Heart1.set_frame(2)
		$Heart2.set_frame(1)
		$Heart3.set_frame(0)
	if health == 2:
		$Heart1.set_frame(2)
		$Heart2.set_frame(2)
		$Heart3.set_frame(0)
	if health == 1:
		$Heart1.set_frame(2)
		$Heart2.set_frame(2)
		$Heart3.set_frame(1)
	if health == 0:
		$Heart1.set_frame(2)
		$Heart2.set_frame(2)
		$Heart3.set_frame(2)
		get_tree().quit()
