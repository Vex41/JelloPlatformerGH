extends Area2D




func _on_Area2D_area_entered(_area):
	get_tree().change_scene("res://Scenes/Level3.tscn")
