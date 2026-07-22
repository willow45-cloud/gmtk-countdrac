extends Node2D

var x_location = Vector2(400,200)

func _ready() -> void:
	$".".hide()
	
	
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	var spawn_location_x = randi_range(0,1000)
	var spawn_location_y = randi_range(0,600)
	var spawn_postion = Vector2(spawn_location_x,spawn_location_y)
	$".".global_position = spawn_postion
	$".".show()
	$Timer.start()


func _on_button_pressed() -> void:
	print("you got me")
