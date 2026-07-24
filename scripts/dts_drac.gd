extends CharacterBody2D

var location = 0
var bottom_ladder = Vector2(120,175)
var middle_ladder = Vector2(120,115)
var top_ladder = Vector2(120,55)
var moving = false

var drac_dead = false
var once = true
func _process(delta: float) -> void:
	if moving == false and Global.mini_game_over == false:
		if Input.is_action_pressed("up") and location == 0:
			$dancing_drac.global_position = middle_ladder
			
			location += 1
			moving = true
			await get_tree().create_timer(0.1).timeout
			moving = false
		if Input.is_action_pressed("up") and location == 1:
			$dancing_drac.global_position = top_ladder
			
			location += 1
			moving = true
			await get_tree().create_timer(0.1).timeout
			moving = false
		if Input.is_action_pressed("up") and location == 2:
			pass #drac at top of ladder
			moving = true
			await get_tree().create_timer(0.1).timeout
			moving = false
		if Input.is_action_pressed("down") and location == 0:
			pass #drac at bottom of ladder
			moving = true
			await get_tree().create_timer(0.1).timeout
			moving = false
		if Input.is_action_pressed("down") and location == 1:
			location -= 1 
			$dancing_drac.global_position = bottom_ladder
			
			moving = true
			await get_tree().create_timer(0.1).timeout
			moving = false
		if Input.is_action_pressed("down") and location == 2:
			location -= 1
			$dancing_drac.global_position = middle_ladder
		
			moving = true
			await get_tree().create_timer(0.1).timeout
			moving = false
		else:
			pass
			
	
	if drac_dead == true :
		$dancing_drac.play("death")
		velocity.x = 300 * -1
		move_and_slide()
		if once == true:
			once = false
			Global.game_is_over()
			$"../ready_count".hide()
			$"../game_over".show()
			$"../ending_sound".play()
			$"../up".hide()
			$"../down".hide()
			$"../Arrow".hide()
			$"../Arrow2".hide()
			
func _on_area_2d_body_entered(body: Node2D) -> void:
	print(body)
	drac_dead = true
