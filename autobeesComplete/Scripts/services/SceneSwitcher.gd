class_name SceneSwitcher extends Node

static var lobbyScene: PackedScene

static func initialize() -> void:
	# preload required scenes
	lobbyScene = preload("res://Scenes/gameplay/Lobby.tscn")

static func showMainMenu(caller: Node) -> void:
	caller.get_tree().change_scene_to_file("res://Scenes/gameplay/MainMenu.tscn")	

static func showLobby(caller: Node) -> void:
	var currentPlayerName = Game.currentPlayer.playerName
	var lobbyId = Game.currentLobby.lobbyId
	var lobbySceneInstance = SceneSwitcher.lobbyScene.instantiate()
	var nameLabel = lobbySceneInstance.get_node("Rows/Row1/Player1/MarginContainer/Label2")
	nameLabel.text = currentPlayerName
	var codeLabel = lobbySceneInstance.get_node("Code")
	codeLabel.text = Numbers.split_id_with_space(lobbyId)
	
	# switch to the lobby scene, old way vs preload way
	caller.get_tree().root.add_child(lobbySceneInstance)
	caller.queue_free()
