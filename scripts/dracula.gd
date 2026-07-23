extends Sprite2D
var speed = 400


func _ready() -> void:
	pass




func _process(delta: float) -> void:
	if Input.is_action_pressed("left"):
		position += Vector2.LEFT * delta * speed
		
	if Input.is_action_pressed("right"):
		position += Vector2.RIGHT * delta * speed
#left and right fixed, added to input mapping under project setting, (a,d,left,right) :3
