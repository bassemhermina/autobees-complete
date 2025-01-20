extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

	# Initialize the visibility of the buttons
	$AR.show()
	$EN.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_button_pressed() -> void:
	$HitButton.play()
	pass # Replace with function body.


func _on_ar_pressed() -> void:
	$HitButton.play()
	$AR.hide()
	$EN.show()
	pass # Replace with function body.


func _on_en_pressed() -> void:
	$HitButton.play()
	$EN.hide()
	$AR.show()
	pass # Replace with function body.
