extends Node

#cargamos la clase base para todos los skill
var skill_base = preload("res://scenes//entities//skill.tscn") as PackedScene

func _ready():
	pass 

#desde aca generamos los skill y se los devolvemos al padre
# que solicito el skill
func create_skills( skills ):
	
	for skill_name in skills:
		#generamos un nuevo objeto que es una copia en este caso de skill
		var skill = skill_base.instance()
			
		#cargamos el script nuevo y se lo asiganamos al objeto que creamos antes
		
		skill.set_script(load("res://scripts//skills//" + str(skill_name) +".gd"))
		skill.add_to_group("skill")
		
		#agregamos el habilidad como hijo		
		self.add_child( skill )
		
		#ejecutamos el init de la habilidad
		skill.initialice( get_parent() )
		
		#ejecutamos por primera vez la habilidad
		skill.execute()
		
	#mostramos las habilidades
	showSkills()
	
func showSkills():
	
	for s in self.get_children():
		$skillcontainer.remove_child(s)
	
	for s in self.get_children():
		if( s.is_in_group("skill")):
			var container = $container.duplicate()
			container.get_node("image").texture = load(s.iconPath)	
			container.show()
			$skillcontainer.add_child(container)
