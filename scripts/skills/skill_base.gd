extends Node

#var id_skill: int = 0
var owner_skill = null
#var objects 
#var type    = "common"
var iconPath:String = "";

func _ready():
	pass 
	
func initialice(owner_skill):	
	self.owner_skill = owner_skill

func execute():
	pass

	
