extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Reset_Timer()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	pass

var sec=60
var Dsec=60


func _on_timer_timeout():
	if sec>0:
		sec-=1
	
	$TimerBox/MarginContainer/Letter.text="0:"+str(sec)
	pass # Replace with function body.


func Reset_Timer():
	@warning_ignore("standalone_expression")
	sec==Dsec

func _on_submit_button_pressed() -> void:
	$HitButton.play()
	$BackgroundMusic.stop()
	pass # Replace with function body.
