extends Node2D

var currentPlayer: Player
var currentLobby: Lobby

func _ready():
	# initialize the firebase connection
	FirebaseWrapper.initialize()
	SceneSwitcher.initialize()
	
	# push the curernt player
	self.currentPlayer = Player.new(Numbers.generate_random_id())
	if not FirebaseWrapper.database_connection_initialized:
		Firebase.Auth.signup_succeeded.connect(_push_player_to_database)
	else:
		_push_player_to_database({})
	
	# keeps current player alive on the database state.
	# TODO
	
func playButtonSound():
	$HitButton1.play()

func _push_player_to_database(auth_info: Dictionary):
	FirebaseWrapper.pushPlayer(self.currentPlayer)
