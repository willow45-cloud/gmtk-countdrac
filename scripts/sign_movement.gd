extends CharacterBody2D

var sign_type = 0 
var playing = false
var speed = 50
var I_am_grant = false
@onready var head_type_1: Sprite2D = $Sprite2D/head_type1


func _ready():
	$Sprite2D/Button.disabled = false
	Global.grant_chosen_false()
	$Sprite2D/head_type1.hide()
	$Sprite2D/head_type2.hide()
	$Sprite2D/head_type3.hide()
	$Sprite2D/head_type4.hide()
	
	#head picker
	
	var timer_range = randf_range(0.1,1)
	await get_tree().create_timer(timer_range).timeout
	if Global.grant_chosen == false:
		head_type_1 = $Sprite2D/head_type1
		Global.grant_chosen_true()
		I_am_grant = true
	
	if Global.grant_chosen == true and I_am_grant == false:
		var head_type = randi_range(1,3)
		if head_type == 1:
			head_type_1= $Sprite2D/head_type2
		elif head_type == 2:
			head_type_1=  $Sprite2D/head_type3
		elif head_type == 3:
			head_type_1=$Sprite2D/head_type4
		else:
			pass
	
	await get_tree().create_timer(2).timeout
	playing = true
	await get_tree().create_timer(1).timeout
	$"../AnimationPlayer".play("wiggle")
	await get_tree().create_timer(2).timeout
	$"../AnimationPlayer".play("flip")
	#play flip animation here
	head_type_1.show()
	await get_tree().create_timer(0.5).timeout
	$"../AnimationPlayer".play("wiggle")
	
func _process(delta: float) -> void:
	
	if playing == true:
		#overkill
		if $Sprite2D.global_position.y == -50: # top signs
			sign_type = 1 
		if $Sprite2D.global_position.y == 260: # bottom signs
			sign_type = 2
		if $Sprite2D.global_position.x == -60: # left signs
			sign_type = 3 
		if $Sprite2D.global_position.x == 440: # right signs 
			sign_type = 4
		
		#very overkill
		if sign_type == 1:
			if $Sprite2D.global_position.y <= 40:
				velocity.y = speed * 1
				move_and_slide()
			
		if sign_type == 2:
			if $Sprite2D.global_position.y >= 170:
				velocity.y = speed * -1
				move_and_slide()
		
		if sign_type == 3:
			if $Sprite2D.global_position.x <= 45:
				velocity.x = speed * 1
				move_and_slide()
		

		if sign_type == 4:
			if $Sprite2D.global_position.x >= 340:
				velocity.x = speed * -1
				move_and_slide()

		
	
	if Global.mini_game_over == true:
		$Sprite2D/Button.disabled = true
	
				
func _on_button_pressed() -> void:
	if I_am_grant == true:
		print("you win")
		Global.game_won_1()
		Global.game_is_over()
	elif I_am_grant == false:
		print("nope")
		Global.game_is_over()
		Global.game_won_2()
