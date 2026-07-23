extends CharacterBody2D


const speed_y = 100
const speed_x = 100
var direction_x = -1
var direction_y = 1 

var button_clicked = false
var x_location = 0 


func _ready() -> void:
	$Spawner.hide()
	$Spawner/shadow.hide()
	var timer_range = randf_range(5,6.5)
	$Spawner/Timer.wait_time = timer_range
	$Spawner/Timer.start()

#picks new location and time randomly on timer end 
func _on_timer_timeout() -> void:
	var LeftOrRight = randi_range(0,1)
	if LeftOrRight == 0: #left side
		x_location = -50
		direction_x = 1 
	elif LeftOrRight == 1: #right side
		x_location = 460
		direction_x = -1
	else:
		print("leftrighterror")
	var y_location = randi_range(15, 210)
	var spawn_postion = Vector2(x_location,y_location)
	$Spawner.global_position = spawn_postion
	$Spawner.show()
	$Spawner/Button.show()
	var timer_range = randf_range(3,7)
	$Spawner/Timer.wait_time = timer_range
	$Spawner/Timer.start()
	
	
	#rice movement
func _physics_process(delta: float) -> void:
	if Global.mini_game_over == false:
		velocity.x = direction_x * speed_x
		#velocity.y = speed_y * direction_y
		move_and_slide()
		var spin_amount = randf_range(0,0.1)
		$Spawner.global_rotation += spin_amount
	elif Global.mini_game_over == true:
		$Spawner.hide()
	else:
		pass
	

	#what ya doing in my rice movement script huh?
	

#when button clicked 

func _on_button_pressed() -> void:
	Global.button_pressed_frsound_true()
	print("you got me")
	button_clicked = true
	
	if button_clicked == true:
		$Spawner.hide()
		$Spawner/Button.hide()
		Global.add_rice()
		$"../../better_rice_pickup".play()
		await get_tree().create_timer(0.2).timeout
		Global.button_pressed_frsound_false()
		
	elif button_clicked == false:
		pass
	#updates win condition when button clicked	#can be tweaked if needed
	if Global.amount_rice_clicked <= 20:
		Global.make_end_2()
		print("1")
	elif Global.amount_rice_clicked > 20 and Global.amount_rice_clicked <= 25:
		Global.make_end_4()
		print("2")
	elif Global.amount_rice_clicked > 25 and Global.amount_rice_clicked <= 30:
		Global.make_end_1()
		print("3")
	elif Global.amount_rice_clicked > 30:
		Global.make_end_3()
		print("4")
	else:
		print("rice count error")
