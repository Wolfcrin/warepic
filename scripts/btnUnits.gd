extends Button

export(String) var unidad = ""

func _ready():
	pass 



func _on_crearUnidad_pressed():
	get_parent().createUnidad( self.unidad )
