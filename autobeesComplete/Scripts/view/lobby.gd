extends Control

var rows: Array[Node] = []

func _ready():
	rows.append(get_node("Rows/Row1"))
	rows.append(get_node("Rows/Row2"))
	rows.append(get_node("Rows/Row3"))
	rows.append(get_node("Rows/Row4"))
	rows.append(get_node("Rows/Row5"))
	
	renderLobbyObj(Game.currentLobby)
	watchLobbyUpdates(Game.currentLobby)

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
	# Render lobby ID
	var lobbyId = lobby.lobbyId
	var codeLabel = get_node("Code")
	codeLabel.text = Numbers.split_id_with_space(lobbyId)
	
	var names = []
	for key in lobby.players.keys():
		names.append(lobby.players[key].playerName)
		
	var name_index = 0
	for row in rows:
		if name_index >= names.size():
			break
		
		row.visible = true		
		var player1 = row.get_child(0)
		var player2 = row.get_child(1)
		player1.visible = false
		player2.visible = false

		player1.get_child(0).get_child(0).text = names[name_index]
		player1.visible = true
		name_index += 1
		if name_index < names.size():
			player2.get_child(0).get_child(0).text = names[name_index]
			player2.visible = true
			name_index += 1

func watchLobbyUpdates(lobby: Lobby):
	FirebaseWrapper.watchLobbyUpdates(lobby, _on_lobby_updated)

func _on_lobby_updated(lobby: Lobby, updates: Object):
	renderLobbyObj(lobby)
