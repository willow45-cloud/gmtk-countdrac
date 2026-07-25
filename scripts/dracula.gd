extends CharacterBody2D
#var speed = 400
var textureduck = load("res://artwork/icon.svg")
var texturestand = load("res://artwork/SVG.png")
signal Overlapped()
#var texturedeath = load()


func _ready() -> void:
	pass




func _process(delta: float) -> void:
	#if Input.is_action_pressed("left"):
		#position += Vector2.LEFT * delta * speed
	
	#if Input.is_action_pressed("right"):
		#position += Vector2.RIGHT * delta * speed
		
	if Input.is_action_just_pressed("left_click"):
		$Sprite2D.texture = (textureduck)
		position.y = 185.45
		
#left and right fixed, added to input mapping under project setting, (a,d,left,right) :3


func _on_sun_body_entered(body: Node2D) -> void:
	print("overlap")
