extends CharacterBody2D
#var speed = 400
var textureduck = load("res://artwork/icon.svg")
var texturestand = load("res://artwork/SVG.png")
@export var RB = false

#var texturedeath = load()


func _ready() -> void:
	pass




func _process(delta: float) -> void:
	#if Input.is_action_pressed("left"):
		#position += Vector2.LEFT * delta * speed
	
	#if Input.is_action_pressed("right"):
		#position += Vector2.RIGHT * delta * speed
		
	if Input.is_action_just_pressed("down"):
		if RB == true:
			$"../GameTimer/Visual".visible = not visible
			$"../End".visible = visible
			$Dracula.play("Duck")
			$CollisionShape2D.position.y = 195.45
			$"../End".text = "Dodged"
			RB = false
			
	#if Input.is_action_just_released("down"):
		#if RB == true:
			#$Dracula.play("Fear")
			#position.y = 157
		
#left and right fixed, added to input mapping under project setting, (a,d,left,right) :3


func _on_sun_body_entered(body: Node2D) -> void:
	RB = true
	$"../GameTimer/Visual".visible = not visible
	$"../End".visible = visible
	$"../End".text = "Awful"
	
	$"../AnimationPlayer".play("Die")
	$Dracula.play("Dievis")
	await get_tree().create_timer(3).timeout
	
	
	
