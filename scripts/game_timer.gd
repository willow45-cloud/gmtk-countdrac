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
		stop
		$Visual._visualcountdownact()
		print()
