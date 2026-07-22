extends Sprite2D
var speed = 400

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta: float) -> void:
	if Input.is_action_pressed("a"):
		position += Vector2.LEFT * delta * speed
		
	if Input.is_action_pressed("d"):
		position += Vector2.RIGHT * delta * speed
