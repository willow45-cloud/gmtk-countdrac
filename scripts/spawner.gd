extends Node2D


var button_clicked = false
var amount_clicked = 0
var moving_speed = 100

func _ready() -> void:
	$".".hide()
	
	
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	var spawn_location_x = randi_range(0,1000)
	var spawn_location_y = randi_range(0,600)
	var spawn_postion = Vector2(spawn_location_x,spawn_location_y)
	$".".global_position = spawn_postion
	$".".show()
	$Button.show()
	var timer_range = randf_range(0.5,3)
	$Timer.wait_time = timer_range
	
	

func _on_button_pressed() -> void:
	print("you got me")
	button_clicked = true
	if button_clicked == true:
		$".".hide()
		$Button.hide()
		amount_clicked += 1 
		
	elif button_clicked == false:
		pass
		
		
		
#func move_at_drac():
#	$".".postition = position.move_toward(Vector2(300,400), moving_speed) 
