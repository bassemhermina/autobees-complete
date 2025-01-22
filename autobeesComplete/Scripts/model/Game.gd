extends Node2D

var lobbyScene: PackedScene

var firebaseWrapper: FirebaseWrapper

var currentPlayer: Player
var currentLobby: Lobby

# players[]
# lobbies[]
# currentPlayer
# currentLobby

func _ready():
	# initialize the firebase connection
	FirebaseWrapper.initialize()
	
	# create the current player model
	self.currentPlayer = Player.new("باسم")
	
	# keeps current player alive on the database state.
	# TODO
	
	# preload required scenes
	lobbyScene = preload("res://Scenes/gameplay/Lobby.tscn")
