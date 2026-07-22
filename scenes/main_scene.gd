extends Node2D


func _ready() -> void:
	pass


func _process(delta: float) -> void:
	if Spawner.drac_spin == true:
		print("rotating")
		$drac.rotate()
		$drac/Timer.start()	
	else:
		pass
		
	
	


func _on_timer_timeout() -> void:
	Spawner.drac_spin = false
