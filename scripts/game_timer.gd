extends Timer
signal counted_down(number)
@export var _count := 5
@onready var label: Label = $Visual


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Visual.numberdisplayed = _count
	$Visual._visualcoutdown()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_timeout() -> void:
	emit_signal("counted_down", _count)
	_count -= 1
	$Visual.numberdisplayed = _count
	$Visual._visualcoutdown()
	print("done")
	
	if _count < 1:
		_ontimeended()
		$Visual._visualcountdownact()
		stop
		print("stopped")

func _ontimeended() -> void:
	$"../CharacterBody2D".RB = true
	if eot == false:
			$"../Node2D/AnimatedSprite2D".play("Sun")
			$"../AnimationPlayer".play("Rise")
			
			await get_tree().create_timer(0.5).timeout
			$"../Node2D/Sun/CollisionShape2D".position.y = 21.984
			
			eot = true
