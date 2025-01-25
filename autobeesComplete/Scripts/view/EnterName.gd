extends Node2D

func _on_name_entered() -> void:
	Game.get_node("HitButton1").play()
	SceneSwitcher.showMainMenu(self)
