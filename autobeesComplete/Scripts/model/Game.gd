extends Node2D

var currentPlayer: Player
var currentLobby: Lobby

func _ready():
	# initialize the firebase connection
	FirebaseWrapper.initialize()
	SceneSwitcher.initialize()
	
	# create the current player model
	self.currentPlayer = Player.new("باسم")
	
	# keeps current player alive on the database state.
	# TODO
	
