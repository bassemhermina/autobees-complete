extends GridContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	for child in get_children():
		if child is Button:
			child.pressed.connect(_on_button_pressed.bind(child))

func _on_button_pressed(button: Button):
	Game.currentLobby.currentLetter = button.text
	print(button.text)
