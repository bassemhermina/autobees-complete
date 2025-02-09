extends Control


func _on_submit_button_pressed() -> void:
	var playerName = get_node("LineEdit").text
	Game.currentPlayer = Player.new(playerName)
	get_tree().change_scene_to_file("res://Scenes/gameplay/MainMenu.tscn")
