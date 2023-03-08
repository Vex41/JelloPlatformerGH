extends StaticBody2D

func _ready():
	$AnimationPlayer.play("Spin")

func _on_Area2D_area_entered(_area):
	queue_free()
