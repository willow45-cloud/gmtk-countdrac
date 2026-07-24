extends CharacterBody2D


var speed_x = 300
var y_location = 125


func _ready() -> void:
	$".".hide()
	var timer_range = randf_range(14.5,16.5) 
	$"../Timer".wait_time = timer_range
	$"../Timer".start()

#picks new location and time randomly on timer end 
func _on_timer_timeout() -> void:
	var y_num = randi_range(0,2)
	if y_num == 0:
		y_location = 60
	elif y_num == 1:
		y_location = 120
	elif y_num == 2:
		y_location = 180
	else:
		print("y error")
		
	var spawn_postion = Vector2(430,y_location)
	$".".global_position = spawn_postion
	$".".show()
	var timer_range = randf_range(2,4)
	$"../Timer".wait_time = timer_range
	$"../Timer".start()



func _physics_process(delta: float) -> void:
	if Global.mini_game_over == false:
		get_node("CollisionShape2D").disabled = false
		velocity.x = speed_x * -1
		move_and_slide()
	elif Global.mini_game_over == true:
		$".".hide()
		get_node("CollisionShape2D").disabled = true
	
	else:
		pass
