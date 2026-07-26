extends Timer
signal counted_down(number)
@export var _count := 5
@onready var label: Label = $Visual
var eot = false
@export var _quicktime := 0.5


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_count = randi_range(3,6)
	wait_time = randf_range(0.4, 1.25)
	_quicktime = randf_range(0.3, 0.6)
	$Visual.numberdisplayed = _count
	$Visual._visualcoutdown()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_timeout() -> void:
	emit_signal("counted_down", _count)
	_count -= 1
	$Visual.numberdisplayed = _count
	$"../Timerbeep".play()
	#$"../TextureRect".texture.Gradient2D = Vector4(131, 42, 1, 255)
	$Visual._visualcoutdown()
	print("done")
	
	if _count < 1:
		_ontimeended()
		$Visual._visualcountdownact()
		stop
		$"../Timerbeep".volume_db = -80
		print("stopped")

func _ontimeended() -> void:
	$"../CharacterBody2D".RB = true
	if eot == false:
			$"../Start".play()
			$"../Node2D/AnimatedSprite2D".play("Sun")
			$"../AnimationPlayer".play("Rise")
			await get_tree().create_timer(0.5).timeout
			$"../Node2D/Sun/CollisionShape2D".position.y = -8
			eot = true
