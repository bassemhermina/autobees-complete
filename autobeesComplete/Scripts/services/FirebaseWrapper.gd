class_name FirebaseWrapper extends Node

# Inistantiates and initializes the firebase instance, authenticates 
# the user, and ready for interactions.

static var players_ref: FirebaseDatabaseReference
static var lobbies_ref: FirebaseDatabaseReference

# Provides an API to ease the transfers across the database, allowing
# full reflection into the game model through the API.

static func initialize() -> void:
	print("FirebaseWrapper instance constructed")
	Firebase.Auth.signup_succeeded.connect(_on_signup_success)
	Firebase.Auth.login_anonymous()
	
static func _on_signup_success(auth_info: Dictionary):
	print("Successfully logged in as an anonymous user!")
	players_ref = Firebase.Database.get_database_reference("/players")
	lobbies_ref = Firebase.Database.get_database_reference("/lobbies")

static func pushPlayer(player: Player) -> void:
	players_ref.update('/', player.to_dict())
	
static func pushLobby(lobby: Lobby) -> void:
	lobbies_ref.update('/', lobby.to_dict())
	
static func getAvailableLobbies() -> Array[Lobby]:
	var lobbies_arr: Array[Lobby] = []
	var lobbies_dict = lobbies_ref.get_data()
	for lobbyId in lobbies_dict.keys():
		var lobbyData = lobbies_dict[lobbyId]
		var lobby = Lobby.new().from_dict(lobbyId, lobbyData)
		lobbies_arr.push_back(lobby)
		print(lobby.to_dict())
	return lobbies_arr
