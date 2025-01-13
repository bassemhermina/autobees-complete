extends Node
#
#func _ready() -> void:
	## Authenticate as an anonymous user
	#print(Firebase.Auth.has_signal("signup_succeeded"))
	#Firebase.Auth.signup_succeeded.connect(_on_signup_success)
	#print(Firebase.Auth.is_connected("signup_succeeded", _on_signup_success))
	#Firebase.Auth.login_anonymous()
#
#func _on_signup_success(auth_info: Dictionary):
	#print("Successfully logged in as an anonymous user!")
	#
	## Connect to the database reference and read data
	#var db_ref = Firebase.Database.get_database_reference("/", {})
	#db_ref.connect("new_data_update", _on_db_data_update)
#
#func _on_db_data_update(value):
	#print("Database value updated: ", value)
#
##func _process(delta):
	##if Firebase.Auth.is_logged_in():
		##print("User is logged in!")
