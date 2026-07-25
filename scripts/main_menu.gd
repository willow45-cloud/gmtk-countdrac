extends Node2D

var input_disabled = true
#code for main menu here
func _ready():
	$back_ground/moving_opening/credit_holder.hide()
	$back_ground/KitchenFloor/RiceSprite1.hide()
	$back_ground/KitchenFloor/RiceSprite5.hide()
	$back_ground/KitchenFloor/RiceSprite6.hide()
	$back_ground/KitchenFloor/RiceSprite2.hide()
	$back_ground/KitchenFloor/RiceSprite3.hide()
	$back_ground/KitchenFloor/RiceSprite4.hide()
	await get_tree().create_timer(1.0).timeout
	$back_ground/moving_opening/AnimatedSprite2D.play("default")
	$back_ground/moving_opening/AnimationPlayer.play("opening_walk")
	await get_tree().create_timer(2.0).timeout
	$back_ground/moving_opening/AnimationPlayer.play("credits")
	await get_tree().create_timer(0.1).timeout
	$back_ground/moving_opening/credit_holder.show()

	$back_ground/KitchenBackground/AudioStreamPlayer.play()
	await get_tree().create_timer(3).timeout
	$back_ground/moving_opening/AnimationPlayer.play("move_up")
	$AudioStreamPlayer.play()
	$back_ground/dancing.play("default")
	$back_ground/dancing2.play("default")
	await get_tree().create_timer(1.0).timeout
	
	input_disabled = false
	
	
func _on_level_1_pressed() -> void:
	if input_disabled == false:
		get_tree().change_scene_to_file("res://scenes/count_the_rice.tscn")
		


func _on_level_2_pressed() -> void:
	if input_disabled == false:
		get_tree().change_scene_to_file("res://scenes/dodge_the_stakes.tscn")



func _on_level_3_pressed() -> void:
	if input_disabled == false:
		get_tree().change_scene_to_file("res://scenes/find_grant.tscn")


func _on_level_4_pressed() -> void:
	if input_disabled == false:
		get_tree().change_scene_to_file("res://scenes/Avoid_the_sun.tscn")


func _on_button_5_pressed() -> void:
	pass # Replace with function body.


func _on_button_6_pressed() -> void:
	pass # Replace with function body.





func _on_level_1_mouse_entered() -> void:	
	if input_disabled == false:
		$back_ground/KitchenFloor/RiceSprite1.show()
		$back_ground/KitchenFloor/RiceSprite5.show()
		$back_ground/KitchenFloor/RiceSprite6.show()
		$back_ground/KitchenFloor/RiceSprite2.show()
		$back_ground/KitchenFloor/RiceSprite3.show()
		$back_ground/KitchenFloor/RiceSprite4.show()
		$back_ground/KitchenFloor.scale = Vector2(1.2, 1.2)
		$back_ground/KitchenFloor/AudioStreamPlayer.play()

func _on_level_1_mouse_exited() -> void:
	if input_disabled == false:
		$back_ground/KitchenFloor/RiceSprite1.hide()
		$back_ground/KitchenFloor/RiceSprite5.hide()
		$back_ground/KitchenFloor/RiceSprite6.hide()
		$back_ground/KitchenFloor/RiceSprite2.hide()
		$back_ground/KitchenFloor/RiceSprite3.hide()
		$back_ground/KitchenFloor/RiceSprite4.hide()
		$back_ground/KitchenFloor.scale = Vector2(1.15, 1.15)

func _on_level_2_mouse_entered() -> void:
	if input_disabled == false:
		$back_ground/SteakdodgeBackground/dancing.play("default")
		$back_ground/SteakdodgeBackground.scale = Vector2(1.2, 1.2)
		$back_ground/SteakdodgeBackground/AnimationPlayer.play("stake_move")
		$back_ground/SteakdodgeBackground/AudioStreamPlayer.play()
	
func _on_level_2_mouse_exited() -> void:
	if input_disabled == false:
		$back_ground/SteakdodgeBackground/dancing.play("stop")
		$back_ground/SteakdodgeBackground.scale = Vector2(1.15, 1.15)
		$back_ground/SteakdodgeBackground/AnimationPlayer.stop()
	
func _on_level_3_mouse_entered() -> void:
	if input_disabled == false:
		$back_ground/KitchenBackground.scale = Vector2(1.2, 1.2)
		$back_ground/KitchenBackground/AudioStreamPlayer2.play()

func _on_level_3_mouse_exited() -> void:
	if input_disabled == false:
		$back_ground/KitchenBackground.scale = Vector2(1.15, 1.15)


func _on_level_4_mouse_entered() -> void:
	if input_disabled == false:
		$back_ground/NightSunDodgeBackground/AnimationPlayer.play("moon_move")
		$back_ground/NightSunDodgeBackground.scale = Vector2(1.2, 1.2)
		$back_ground/NightSunDodgeBackground/AudioStreamPlayer.play()
	
func _on_level_4_mouse_exited() -> void:
	if input_disabled == false:
		$back_ground/NightSunDodgeBackground/AnimationPlayer.stop()
		$back_ground/NightSunDodgeBackground.scale = Vector2(1.15, 1.15)
		

func _on_button_mouse_entered() -> void:
	if input_disabled == false:
		$back_ground/exit_button.scale = Vector2(0.7, 0.7)


func _on_button_mouse_exited() -> void:
	if input_disabled == false:
		$back_ground/exit_button.scale = Vector2(0.5, 0.5)


func _on_button_pressed() -> void:
	if input_disabled == false:
		get_tree().quit()
