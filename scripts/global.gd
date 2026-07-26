extends Node

#no touch
var auto_display_end_text = false
var end_text = 2 # defaults to awful score 
var what_counter_doing = 0
var text_running = false
var auto_start_countdown = false
var amount_rice_clicked = 0 
var button_pressed_frsound = false
var mini_game_over = false
var grant_chosen = false
var game_won = 0
var spawn_button = false


var got_star1 = false
var got_star2 = false
var got_star3 = false
var got_star4 = false










func _ready() -> void:
	what_counter_doing = 0
	text_running = false

#you shouldnt need these
func text_go():
	text_running = true
	
#you shouldnt need these
func text_stop():
	text_running = false
	
	#can use ones in lines
	#---------------------------------------------------------------------------------
	
	# run functions in your own script by putting "Global.make_count_NUM()"
	# edge cases should be handeled on my end 
	#look at count_the_rice script for example of how to use :3
	
	
	# used on my end to autostart (10,9,8) after (ready,go)
func auto_start_true():
	auto_start_countdown = true	
	
func auto_start_false():
	auto_start_countdown = false	

	#makes no text 
func make_counter_0():
	what_counter_doing = 0
	
	#makes (ready,3,2,1,go)
func make_counter_1():
	what_counter_doing = 1
	
	#displays texts counting down from 10
func make_counter_2():
	what_counter_doing = 2
	
	#does what it says on the tin
func auto_display_end_text_true():
	auto_display_end_text = true
	
func auto_display_end_text_false():
	auto_display_end_text = false
	
	#displays end text
func make_counter_3():
	what_counter_doing = 3	
	
	
	#feel free to hook your game ending to this global condition on your side
func game_is_over():
	mini_game_over = true
	
func game_is_not_over():
	mini_game_over = false 
	
	
	
	#---------------------------------------------------------------------------------
	

	#spare
func make_counter_4():
	what_counter_doing = 4
	
	#used on my end to decide player end score text
func make_end_1():
	end_text = 1 
	
func make_end_2():
	end_text = 2
	
func make_end_3():
	end_text = 3
	
func make_end_4():
	end_text = 4
	
func make_end_0():
	end_text = 0
	
func add_rice():
	amount_rice_clicked += 1 

func button_pressed_frsound_true():
	button_pressed_frsound = true
	
func button_pressed_frsound_false():
	button_pressed_frsound = false
	
	
func grant_chosen_true():
	grant_chosen = true
	
func grant_chosen_false():
	grant_chosen = false	
	
func game_won_0():	
	game_won = 0	
	
func game_won_1():	
	game_won = 1		

	
func game_won_2():	
	game_won = 2		
	
	
func spawn_button_true():
	spawn_button = true
	
func spawn_button_false():
	spawn_button = false
	
	
func got_star1_true():
	got_star1 = true
	
func got_star2_true():
	got_star2 = true
	
func got_star3_true():
	got_star3 = true
	
func got_star4_true():
	got_star4 = true
	
		
		

	
