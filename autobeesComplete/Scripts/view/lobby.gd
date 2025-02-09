extends Control

func _on_start_button_pressed() -> void:
	Game.playButtonSound()
	get_tree().change_scene_to_file("res://Scenes/gameplay/Alphabet.tscn")	

func _on_ar_pressed() -> void:
	$HitButton.play()
	$AR.hide()
	$EN.show()

func _on_en_pressed() -> void:
	$HitButton.play()
	$EN.hide()
	$AR.show()

func renderLobbyObj(lobby: Lobby):
	var currentPlayerId = Game.currentPlayer.playerId
	var currentPlayer = lobby.players.get(currentPlayerId)
	var currentPlayerName = currentPlayer.playerName
	var lobbyId = lobby.lobbyId
	var nameLabel = get_node("Rows/Row1/Player1/MarginContainer/Label2")
	nameLabel.text = currentPlayerName
	var codeLabel = get_node("Code")
	codeLabel.text = Numbers.split_id_with_space(lobbyId)

func watchLobbyUpdates(lobby: Lobby):
	FirebaseWrapper.watchLobbyUpdates(lobby, _on_lobby_updated)

func _on_lobby_updated(lobby: Lobby, updates: Object):
	print("lobby was updated!", lobby.lobbyId, lobby, updates)
	renderLobbyObj(lobby)
