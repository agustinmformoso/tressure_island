extends Control


func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://game.tscn")
	pass # Replace with function body.

func _on_credits_pressed() -> void:
	get_tree().change_scene_to_file("res://utils/credits/credits.tscn")
	
	pass # Replace with function body.
