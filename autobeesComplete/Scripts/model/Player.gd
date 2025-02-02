class_name Player extends Node

var playerId: String
var playerName: String
var keepAlive: int
var createdAt: int

func _init(nname: String) -> void:
	self.playerId = Numbers.generate_random_id()
	self.playerName = nname
	self.keepAlive = 0
	self.createdAt = Time.get_unix_time_from_system()

func from_dict(id, dict) -> Player:
	self.playerId = id
	self.playerName = dict["playerName"]
	self.keepAlive = dict["keepAlive"]
	self.createdAt = dict["createdAt"]
	return self

func to_dict():
	return {
		self.playerId: {
			"playerName": self.playerName,
			"keepAlive": self.keepAlive,
			"createdAt": self.createdAt
		}
	}

static func map_from_dict(players):
	var ret = {}
	var playersIds = players.keys()
	for playerId in playersIds:
		var data_dict = players.get(playerId)
		var player = Player.new(playerId).from_dict(playerId, data_dict)
		ret[playerId] = player
	return ret

static func map_to_dict(players):
	var ret = {}
	var playersIds = players.keys()
	for playerId in playersIds:
		var player = players.get(playerId)
		ret[playerId] = player.to_dict().get(playerId)
	return ret
