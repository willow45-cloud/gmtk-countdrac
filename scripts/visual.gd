extends Label
var numberdisplayed
@export var actiondisplayed := "duck"
@export var fail := "Awful"
@export var sucess := "Congrats"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = visible


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#func _on_startcountdown_timeout() -> void:
	#visible = visible


#func _on_game_timer_timeout() -> void:
	#visible = not visible`

func _visualcoutdown() -> void:
	text = (str(numberdisplayed))
	

func _visualcountdownact() -> void:
	text = (actiondisplayed)

func _visualfail() -> void:
	text = (fail)

func _visualsucc() -> void:
	text = (sucess)
