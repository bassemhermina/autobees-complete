extends Node2D

# This is a game model class.
# it keeps track of the current game state, regarding players,
# lobby, their scores, ..etc. As a replica of the database.

var firebaseWrapper: FirebaseWrapper

var currentPlayer: Player
var currentLobby: Lobby

# players[]
# lobbies[]
# currentPlayer
# currentLobby

# when initialized, creates the (me) player, logs (me)
#  into firebase, keeps (me) alive.

func _ready():
	print("Game model global instance constructed")
	FirebaseWrapper.initialize()
	self.currentPlayer = Player.new("bassem")
