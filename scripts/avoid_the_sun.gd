extends Node2D
@onready var label: Timer = $GameTimer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$CharacterBody2D/Dracula.play("Draculawalk")
	$AnimationPlayer.play("Movearound")
	await get_tree().create_timer(2).timeout
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
