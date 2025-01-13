extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_create_button_pressed() -> void:
	$HitButton1.play()

	FirebaseWrapper.pushPlayer(Game.currentPlayer)
	var newLobby = Lobby.new()
	FirebaseWrapper.pushLobby(newLobby)

func _on_join_button_pressed():
	$HitButton2.play()
	
	var lobbies = FirebaseWrapper.getAvailableLobbies()
	#get_tree().change_scene_to_file("res://Scenes/gameplay/GameRound.tscn")
	
	
