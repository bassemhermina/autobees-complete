extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_create_button_pressed() -> void:
	# play the button sound
	Game.get_node("HitButton1").play()

	# push the current player to firebase
	FirebaseWrapper.pushPlayer(Game.currentPlayer)
	
	# create a new lobby and push it to firebase
	var newLobby = Lobby.new()
	Game.currentLobby = newLobby
	FirebaseWrapper.pushLobby(newLobby)
	
	# Update the lobby scene with the player and lobby data
	var currentPlayerName = Game.currentPlayer.playerName
	var lobbyId = Game.currentLobby.lobbyId
	var lobbySceneInstance = Game.lobbyScene.instantiate()
	var nameLabel = lobbySceneInstance.get_node("Rows/Row1/Player1/MarginContainer/Label2")
	nameLabel.text = currentPlayerName
	var codeLabel = lobbySceneInstance.get_node("Code")
	codeLabel.text = Numbers.split_id_with_space(lobbyId)
	
	# switch to the lobby scene, old way vs preload way
	#get_tree().change_scene_to_file("res://Scenes/gameplay/Lobby.tscn")
	get_tree().root.add_child(lobbySceneInstance)
	queue_free()

func _on_join_button_pressed():
	Game.get_node("HitButton2").play()
	get_tree().change_scene_to_file("res://Scenes/gameplay/JoinWithId.tscn")	
