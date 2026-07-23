extends Node2D

func _ready() -> void:
	$start.hide()
	$go.hide()
	$"1".hide()
	$"2".hide()
	$"3".hide()
	$"4".hide()
	$"5".hide()
	$"6".hide()
	$"7".hide()
	$"8".hide()
	$"9".hide()
	$"10".hide()
	$good_job.hide()
	$awful.hide()
	$amazing.hide()
	$blnt.hide()
	$next_button.hide()
	
	
	
	
	#checks what value from global script and displays correct text
func _process(delta: float) -> void:
	if Global.what_counter_doing == 1 and Global.text_running == false:
		start_go()
		Global.text_go()
		await get_tree().create_timer(0.2).timeout
	elif Global.what_counter_doing == 2 and Global.text_running == false:
		countdown_from_10()
		Global.text_go()
		await get_tree().create_timer(0.2).timeout
	elif Global.what_counter_doing == 3 and Global.text_running == false:
		display_end_text()
		Global.text_go()
		await get_tree().create_timer(0.2).timeout	
		
	else:
		Global.text_stop()
		Global.make_counter_0()
		await get_tree().create_timer(0.2).timeout	



#displays texts going (ready,3,2,1,go)
func start_go():
	$start.show()
	$"../start".play()
	await get_tree().create_timer(1).timeout
	$start.hide()
	$"3".show()
	$start_counting.play()
	await get_tree().create_timer(1).timeout
	$"3".hide()
	$"2".show()
	$start_counting.play()
	await get_tree().create_timer(1).timeout
	$"2".hide()
	$"1".show()
	$start_counting.play()
	await get_tree().create_timer(1).timeout
	$"1".hide()
	$"go".show()
	$"../go".play()
	await get_tree().create_timer(1).timeout
	$"go".hide()
	Global.text_stop()
	if Global.auto_start_countdown == true:
		countdown_from_10()
		Global.auto_start_false()
	elif Global.auto_start_countdown == false:
		pass
	
	
	
	
#to be clear this is a very stupid way of doing this, although might be more reasource inclusive, idk the count doesn't pay me well 
#displays texts counting down from 10
func countdown_from_10():
	$"10".show()
	$counting_down.play()
	await get_tree().create_timer(1).timeout
	$"10".hide()
	$"9".show()
	$counting_down.play()
	await get_tree().create_timer(1).timeout
	$"9".hide()
	$"8".show()
	$counting_down.play()
	await get_tree().create_timer(1).timeout
	$"8".hide()
	$"7".show()
	$counting_down.play()
	await get_tree().create_timer(1).timeout
	$"7".hide()
	$"6".show()
	$counting_down.play()
	await get_tree().create_timer(1).timeout
	$"6".hide()
	$"5".show()
	$counting_down.play()
	await get_tree().create_timer(1).timeout
	$"5".hide()
	$"4".show()
	$counting_down.play()
	await get_tree().create_timer(1).timeout
	$"4".hide()
	$"3".show()
	$counting_down.play()
	await get_tree().create_timer(1).timeout
	$"3".hide()
	$"2".show()
	$counting_down.play()
	await get_tree().create_timer(1).timeout
	$"2".hide()
	$"1".show()
	$counting_down.play()
	await get_tree().create_timer(1).timeout
	$"1".hide()
	$counting_down.play()
	Global.text_stop()
	if Global.auto_display_end_text == true:
		display_end_text()
		Global.auto_display_end_text_false()
	elif Global.auto_display_end_text == false:
		pass
	
	
	
	#should use switch case statement but idc 
func display_end_text():
	$ending_sound.play()
	Global.game_is_over()
	if Global.end_text == 0:
		pass
	elif Global.end_text == 1:
		$good_job.show()
	elif Global.end_text == 2:
		$awful.show()
	elif Global.end_text == 3:
		$amazing.show()
	elif Global.end_text == 4:
		$blnt.show()
	else:
		pass
	Global.text_stop()
	#shows next button
	$next_button.show()

# clicking next will cause rice to re-appear, this is intened do not worry
func _on_next_button_pressed() -> void:
	print("goes next level")
	Global.game_is_not_over()
