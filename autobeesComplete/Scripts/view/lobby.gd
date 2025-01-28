extends Control

func _on_start_button_pressed() -> void:
	Game.playButtonSound()

func _on_ar_pressed() -> void:
	$HitButton.play()
	$AR.hide()
	$EN.show()

func _on_en_pressed() -> void:
	$HitButton.play()
	$EN.hide()
	$AR.show()

func renderLobbyObj(lobby: Lobby):
	var currentPlayerName = Game.currentPlayer.playerName
	var lobbyId = Game.currentLobby.lobbyId
	var nameLabel = get_node("Rows/Row1/Player1/MarginContainer/Label2")
	nameLabel.text = currentPlayerName
	var codeLabel = get_node("Code")
	codeLabel.text = Numbers.split_id_with_space(lobbyId)
	FirebaseWrapper.watchLobbyUpdates(lobby, _on_lobby_updated)

func _on_lobby_updated(lobby: Lobby):
	print("lobby was updated!", lobby.lobbyId)
	# here, it should be responsible for comparing what it
	# gets from the database, and updating the rendered scene
	# accordingly, like react.
