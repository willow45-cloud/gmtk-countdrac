extends Node2D

var do_once = false

func _ready() -> void:
	$amazing.hide()
	$next.hide()
	$awful.hide()
	
	Global.make_end_2()
	Global.game_is_not_over()
	await get_tree().create_timer(2).timeout
	Global.make_counter_1()
	Global.auto_start_true()
	#auto displays result of mini-game
	Global.auto_display_end_text_true()



func _process(delta: float) -> void:
	if Global.mini_game_over == true and do_once == false and Global.game_won == 1:
		do_once = true
		$amazing.show()
		$next.show()
		$ready_count.hide()
		$ending_sound.play()
		await get_tree().create_timer(2).timeout
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), true)
		
		
	if Global.mini_game_over == true and do_once == false and Global.game_won == 2:	
		do_once = true
		$next.show()
		$ready_count.hide()
		$ending_sound.play()
		$ending_sound.play()
		$awful.show()
		await get_tree().create_timer(2).timeout
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), true)
	
		
func _on_next_pressed() -> void:
	AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), false)
	print("next level")
