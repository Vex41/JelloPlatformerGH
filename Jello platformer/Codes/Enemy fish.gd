extends KinematicBody2D


func _ready():
	$AnimationPlayer.play("chomp")


func _on_Area2D_area_entered(_area):
	get_tree().reload_current_scene()
	#get_tree().change_scene("res://Scenes/World.tscn")
