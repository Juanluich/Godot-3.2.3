extends Control


func _on_PLAY_pressed():
	get_tree().change_scene("res://Action RPG Resources/World/World.tscn")
	

func _on_EXIT_pressed():
	get_tree().quit()
