class_name Lighthouse
extends StaticBody2D

@onready var hp_label: Label = $Label

var health : int = 100

func take_damage():
	health -= 10
	
	hp_label.text = "HP: " + str(health)
	
	if health == 0:
		get_tree().change_scene_to_file("res://utils/defeated/defeated.tscn")
	
	pass
