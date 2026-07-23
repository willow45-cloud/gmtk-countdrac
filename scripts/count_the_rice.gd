extends Node2D


func _ready() -> void:
	$hand_open.show()
	$hand_closed.hide()
	await get_tree().create_timer(1.5).timeout # breathing time
	#---------------------------------------------------------------------------------
	
	#makes ready3.2.1..
	Global.make_counter_1()
	#makes flow into 10.9.8..
	Global.auto_start_true()
	#auto displays result of mini-game
	Global.auto_display_end_text_true()
	
	#---------------------------------------------------------------------------------
	
	await get_tree().create_timer(3.5).timeout
	$AnimatedSprite2D.play("spilled")
	$better_rice_drop.play()
	
func _process(delta: float) -> void:
	$hand_open.global_position = get_global_mouse_position()
	$hand_closed.global_position = get_global_mouse_position()
	if Input.is_action_pressed("left_click"):
		#should only need update visual rice counter if clicked, probably :/
		$hand_open.hide()
		$hand_closed.show()
		if Input.is_action_pressed("left_click") and Global.button_pressed_frsound == false:
			pass
			#$missed_rice.play()  # the sound is really annoying
		else:
			pass
		await get_tree().create_timer(0.3).timeout
		$hand_open.show()
		$hand_closed.hide()
		$amount_collected.text = str(Global.amount_rice_clicked) + "/30 rice"
	else:
		pass
	
