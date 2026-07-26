extends Node2D
@onready var label: Timer = $GameTimer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.spawn_button_false()
	$next.hide()
	$go.play()
	$CharacterBody2D/Dracula.play("Draculawalk")
	$AnimationPlayer.play("Movearound")
	$GameTimer/Visual.visible = not visible
	
	$End.visible = not visible
	$ToolTip.visible = not visible
	await get_tree().create_timer(2).timeout
	$Node2D/AnimatedSprite2D.play("default")
	$CharacterBody2D/Dracula.stop()
	#$TextureRect2.texture = (dayscene)
	$GameTimer.start()
	$CharacterBody2D/Dracula.play("Fear")
	$GameTimer/Visual.visible = visible
	$ToolTip.visible = visible


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.spawn_button == true:
		$next.show()


func _on_next_pressed() -> void:
	Global.game_is_not_over()
	Global.got_star4_true()
	AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), false)
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn") 
