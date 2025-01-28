class_name SceneSwitcher extends Node

static var lobbyScene: PackedScene

static func initialize() -> void:
	# preload required scenes
	lobbyScene = preload("res://Scenes/gameplay/Lobby.tscn")

static func switchToLobby(caller: Node) -> void:
	var lobbySceneInstance = SceneSwitcher.lobbyScene.instantiate()
	lobbySceneInstance.renderLobbyObj(Game.currentLobby)
	caller.get_tree().root.add_child(lobbySceneInstance)
	caller.queue_free()
