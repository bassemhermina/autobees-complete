class_name Numbers extends Node

static func generate_random_id() -> String:
	var timestamp = Time.get_unix_time_from_system()
	seed(timestamp)
	var random_number = randi() % 1000000000
	return str(random_number)
