extends Node2D


var button_clicked = false
var amount_clicked = 0
var moving_speed = 100


func _ready() -> void:
	$".".hide()
	
	
func _process(delta: float) -> void:
	pass
	
#picks new location and time randomly on timer end 
func _on_timer_timeout() -> void:
	var spawn_location_x = randi_range(0,1000)
	var spawn_location_y = randi_range(0,600)
	var spawn_postion = Vector2(spawn_location_x,spawn_location_y)
	$".".global_position = spawn_postion
	$".".show()
	$Button.show()
	var timer_range = randf_range(0.5,3)
	$Timer.wait_time = timer_range
	
	
#when button clicked
func _on_button_pressed() -> void:
	print("you got me")
	button_clicked = true
	if button_clicked == true:
		$".".hide()
		$Button.hide()
		amount_clicked += 1 
	elif button_clicked == false:
		pass
	#updates win condition when button clicked	
	if amount_clicked == 1 or amount_clicked == 0:
		Global.make_end_2()
	elif amount_clicked == 2 or amount_clicked == 3:
		Global.make_end_4()
	elif amount_clicked == 4 or amount_clicked == 5:
		Global.make_end_1()
	elif amount_clicked  > 5:
		Global.make_end_3()
	else:
		pass
