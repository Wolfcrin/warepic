extends Area2D

var velocidad:int = 50

var life:int      = 3 
var maxLife:int   = 5

var nameUnit:String   = ""
var size:String = ""

var skills = ["fireball", "poison"] 

func _ready():
	
	pass
	
		
func loadUnitData(idUnit:String):
	
	var data_file = File.new()
	if data_file.open("res://assets/jsons/"+idUnit+".json", File.READ) != OK:
		return
	var data_text = data_file.get_as_text()
	data_file.close()
	var data_parse = JSON.parse(data_text)
	if data_parse.error != OK:
		return
	var data = data_parse.result
	
	print( data )
	
	var image  = load("res://assets/images/" + data["textureIdle"])
	$animacion.play(data["textureIdleAnimPlayer"])
	$image.set_texture(image)
	
	var isc = $image.get_texture().get_size() #image size
	
	var shape = CapsuleShape2D.new()
	
	if( data.has("sizeUnit")):
		if( data["sizeUnit"] == "small"):			
	
			$image.position = Vector2(1.2, -21)
			$HUD/life.rect_position = Vector2(-21, -46)
					
			shape.radius = 	14
			shape.height =  10
			$collision.shape = shape								
			$collision.position = Vector2(-5.5, -15.7)
			
			var th = 75 #target height
			var tw = 75 #target width
			scale = Vector2((isc.x/(isc.x/tw))/50, (isc.y/(isc.y/th))/50)
			
		elif ( data["sizeUnit"] == "medium"):
			$image.position = Vector2(-13, -15)
			$HUD/life.rect_position = Vector2(-22, -64)
			
			shape.radius = 	30
			shape.height =  26
			$collision.shape = shape								
			$collision.position = Vector2(2, -4)
			
			var th = 128 #target height
			var tw = 128 #target width
			scale = Vector2((isc.x/(isc.x/tw))/50, (isc.y/(isc.y/th))/50)
		else:
			$image.position = Vector2(-13, -15)
			$HUD/life.rect_position = Vector2(-22, -64)
			
			shape.radius = 	30
			shape.height =  26
			$collision.shape = shape								
			$collision.position = Vector2(2, -4)
			
			var th = 200 #target height
			var tw = 200 #target width
			scale = Vector2((isc.x/(isc.x/tw))/50, (isc.y/(isc.y/th))/50)

	$skills.create_skills( skills )
	
	
func updateLife( life ):
	
	if( life >= maxLife):
		$HUD/life.max_value = life
	
	$HUD/life.value += life
	

func _process(delta):
	
	#se ejecuta cada frame 0.01	
	position.x += velocidad * delta
	#print( str(delta))
	#rotation_degrees = 150
	

func _on_Timer_timeout():
	updateLife( -1 )
