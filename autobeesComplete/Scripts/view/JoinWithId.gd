extends Node2D

func _on_join_with_id_pressed() -> void:
	Game.get_node("HitButton1").play()
	
	# get typed game id, and use it to update game model
	
