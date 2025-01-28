extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_create_button_pressed() -> void:
	Game.playButtonSound()
	if not FirebaseWrapper.database_connection_initialized:
		Firebase.Auth.signup_succeeded.connect(_switch_to_lobby)
	else:
		_switch_to_lobby({})

func _on_join_button_pressed():
	Game.get_node("HitButton2").play()
	get_tree().change_scene_to_file("res://Scenes/gameplay/JoinWithId.tscn")	

func _switch_to_lobby(auth_info: Dictionary):
	var newLobby = Lobby.new()
	Game.currentLobby = newLobby
	FirebaseWrapper.pushLobby(newLobby)
	SceneSwitcher.switchToLobby(self)
