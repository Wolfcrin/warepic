extends Area2D

var codeUnit:String  = "" 
var velocidad:int = 50
var life:int      = 3 
var maxLife:int   = 5
var nameUnit:String   = ""

var abilitiesActives = {}
var abilitiespasives = {}


func _ready():
	loadUnitData("0")
	
func loadUnitData(idUnit:String):
	
	var data_file = File.new()
	if data_file.open("res://jsons/orcs.json", File.READ) != OK:
		return
	var data_text = data_file.get_as_text()
	data_file.close()
	var data_parse = JSON.parse(data_text)
	if data_parse.error != OK:
		return
	var data = data_parse.result
	
	print( data )
	
	
	
	
	

func updateLife( life ):
	
	if( life >= maxLife):
		$HUD/life.max_value = life
	
	$HUD/life.value += life
	
func _process(delta):
	
	#se ejecuta cada frame 0.01	
	position.x += velocidad * delta
	print( str(delta))
	

func _on_Timer_timeout():
	updateLife( -1 )
