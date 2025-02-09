extends Node2D

var currentPlayer: Player
var currentLobby: Lobby

func _ready():
	# initialize the firebase connection
	FirebaseWrapper.initialize()
	
	# keeps current player alive on the database state.
	# TODO
	
func playButtonSound():
	$HitButton1.play()
