extends Node2D
@onready var label: Timer = $GameTimer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
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
	pass
