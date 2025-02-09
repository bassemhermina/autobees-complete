class_name SceneSwitcher extends Node

static func switchToLobby(caller: Node) -> void:
	caller.get_tree().change_scene_to_file("res://Scenes/gameplay/Lobby.tscn")
