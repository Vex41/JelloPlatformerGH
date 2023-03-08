extends KinematicBody2D


func _ready():
	$AnimationPlayer.play("chomp")


func _on_Area2D_area_entered(_area):
	pass
