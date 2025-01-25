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
	
	SceneSwitcher.showLobby(self)
	
func _on_join_button_pressed():
	Game.get_node("HitButton2").play()
	get_tree().change_scene_to_file("res://Scenes/gameplay/JoinWithId.tscn")	
