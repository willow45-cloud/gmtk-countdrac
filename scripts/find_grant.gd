extends Node2D

var do_once = false

func _ready() -> void:
	$drac_laught.hide()
	$MobSign.hide()
	$Sprite2D.hide()
	$go.play()
	Global.spawn_button_false()
	$amazing.hide()
	$next.hide()
	$awful.hide()
	$sign_holder.hide()
	
	$mob1.show()
	$mob2.show()
	$AnimationPlayer.play("mob1_bob")
	$AnimationPlayer2.play("mob2_bob")
	

	Global.make_end_2()

	await get_tree().create_timer(2).timeout
	$AudioStreamPlayer.play()
	$drac_laught.show()
	$AnimationPlayer3.play("new_animation")
	$drac_laught.play("default")
	await get_tree().create_timer(0.5).timeout
	$AnimationPlayer2.play("mdown")
	$AnimationPlayer.play("m_downn")

	
	
	Global.game_is_not_over()
	await get_tree().create_timer(2).timeout
	$AnimationPlayer3.play("new_animation_2")
	$MobSign.show()
	$Sprite2D.show()
	
	$drac_laught.hide()
	$sign_holder.show()
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
		
	if Global.spawn_button == true and Global.game_won == 0:
		$next.show()

	
		
		
func _on_next_pressed() -> void:
	Global.got_star3_true()
	Global.game_is_not_over()
	AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), false)
	get_tree().change_scene_to_file("res://scenes/Avoid_the_sun.tscn") # change to other levels when done
