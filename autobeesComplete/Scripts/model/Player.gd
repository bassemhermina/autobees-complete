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

func to_dict():
	return {
		self.playerId: {
			"playerName": self.playerName,
			"keepAlive": self.keepAlive,
			"createdAt": self.createdAt
		}
	}
