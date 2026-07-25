extends Node2D
@onready var label: Timer = $GameTimer
<<<<<<< Updated upstream

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CharacterBody2D/Dracula.play("Draculawalk")
	$AnimationPlayer.play("Movearound")
	await get_tree().create_timer(2).timeout
	
=======
var dayscene = load("res://artwork/DaySunDodgeBackground.png")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$End.visible = not visible
	$ToolTip.visible = not visible
	$GameTimer/Visual.visible = not visible
	$Node2D/AnimatedSprite2D.play("default")
	$CharacterBody2D/Dracula.play("Draculawalk")
	$AnimationPlayer.play("Movearound")
	await get_tree().create_timer(2).timeout
	$CharacterBody2D/Dracula.stop()
	#$TextureRect2.texture = (dayscene)
	$GameTimer.start()
	$CharacterBody2D/Dracula.play("Fear")
	$GameTimer/Visual.visible = visible
	$ToolTip.visible = visible
>>>>>>> Stashed changes


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
