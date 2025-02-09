extends Node2D

func _on_join_with_id_pressed() -> void:
	Game.get_node("HitButton1").play()
	
	var typedLobbyId = $LineEdit_object.text
	var availableLobbies = FirebaseWrapper.pullLobbies()
	var requestedLobby: Lobby
	for lobby in availableLobbies:
		if lobby.lobbyId == typedLobbyId:
			requestedLobby = lobby

	if !requestedLobby:
		return
		
	var currentPlayer = Game.currentPlayer
	var currentPlayerId = currentPlayer.playerId
	requestedLobby.players[currentPlayerId] = currentPlayer
	FirebaseWrapper.pushLobby(requestedLobby)

	Game.currentLobby = requestedLobby
	SceneSwitcher.switchToLobby(self)
