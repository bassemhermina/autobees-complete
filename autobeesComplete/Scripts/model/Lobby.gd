class_name Lobby extends Node

var lobbyId: String
var playersIds: Array[String] = ['sadsd']
var language: String
# var scorePerPlayer: int[]
# var rounds: Round[]
# var availableLetters: String[]
var ableToJoin: bool
var leaderId: String
var createdAt: int

func _init() -> void:
	self.lobbyId = Numbers.generate_random_id()
	self.leaderId = Game.currentPlayer.playerId
	self.language = "Arabic"
	self.ableToJoin = true
	self.createdAt = Time.get_unix_time_from_system()
	
func from_dict(id, dict) -> Lobby:
	self.lobbyId = id
	self.leaderId = dict["leaderId"]
	self.language = dict["language"]
	self.ableToJoin = dict["ableToJoin"]
	self.createdAt = dict["createdAt"]
	self.playersIds = dict["playersIds"] || []
	return self

func to_dict():
	return {
		self.lobbyId: {
			"leaderId": self.leaderId,
			"playersIds": self.playersIds,
			"language": self.language,
			"ableToJoin": self.ableToJoin,
			"createdAt": self.createdAt
		}
	}
