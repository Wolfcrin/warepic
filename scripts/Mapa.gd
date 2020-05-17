extends Node2D

func _ready():
	
	randomize()

func createUnidad( nombreUnidad):
	
	var unidad  = load("res://scenes//entities/unit.tscn")
	var unidadI = unidad.instance()	
	var ry = rand_range(-50,50)	
	unidadI.position = Vector2(100,282 + ry )
	
	$YSort.add_child( unidadI ) 
	unidadI.loadUnitData(nombreUnidad)
	

