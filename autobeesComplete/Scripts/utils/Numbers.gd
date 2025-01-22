class_name Numbers extends Node

static func generate_random_id() -> String:
	var timestamp = Time.get_unix_time_from_system()
	seed(timestamp)
	var random_number = randi() % 1000000
	return str(random_number)

static func split_id_with_space(input_str: String) -> String:
	var mid_index = input_str.length() / 2
	var split_str = input_str.substr(0, mid_index) \
		+ " " + input_str.substr(mid_index, input_str.length() - mid_index)
	return split_str
