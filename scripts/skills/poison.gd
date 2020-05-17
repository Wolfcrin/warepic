extends "res://scripts//skills//skill_base.gd"

func _ready():
	pass 

var timer
var wait_time     = 0.5
var damage_poison = 2

func initialice( owner_skill ):
	.initialice( owner_skill )
	self.iconPath = "res://assets/images/icons/Lightningbolt.png" 

func execute():
	
	timer = Timer.new()
	add_child(timer)
	timer.set_one_shot(false)	
	timer.set_wait_time(wait_time)
	timer.connect("timeout", self, "_execute_timer")
	timer.start()
#	print(owner_skill.name)
	
func _execute_timer():
	print(" Poison " + str( owner_skill.life))
	owner_skill.updateLife( -damage_poison )
	
