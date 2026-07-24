extends Node2D

var bottom_ladder = Vector2(120,175)
var redditor_starLoc = Vector2(358,160)
var anim_gp = Vector2(170,10)
var anim_gp2 = Vector2(450,160)

func _ready() -> void:
	$game_over.hide()
	$up.hide()
	$down.hide()
	$Arrow.hide()
	$Arrow2.hide()
	Global.game_is_over()
	Global.make_end_3()
	$CharacterBody2D.global_position = anim_gp
	$redditor.global_position = anim_gp2
	$CharacterBody2D/dancing_drac.play("default")
	await get_tree().create_timer(2).timeout
	$jump.play()
	$AnimationPlayer.play("opening scene")
	await get_tree().create_timer(3).timeout
	$cutscene.play()
	await get_tree().create_timer(6).timeout
	$redditor.play("default")
	$AnimationPlayer.play("reddit_bob"	)
	Global.game_is_not_over()
	$up.show()
	$down.show()
	$Arrow.show()
	$Arrow2.show()
	#makes ready3.2.1..
	Global.make_counter_1()
	#makes flow into 10.9.8..
	Global.auto_start_true()
	#auto displays result of mini-game
	Global.auto_display_end_text_true()

func _process(delta: float) -> void:
	if Global.mini_game_over == true:
		$up.hide()
		$down.hide()
		$Arrow.hide()
		$Arrow2.hide()
