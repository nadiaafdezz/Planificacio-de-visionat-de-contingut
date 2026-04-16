import random

def generar_pddl(seed, num_contenidos, proporcion_predecesores, num_grupos_paralelas, max_paralelas_por_grupo, nombre_archivo):
	random.seed(seed)
	
	# Generar nombres para los contenidos
	contenidos = [f"contenido_{i}" for i in range(1, num_contenidos + 1)]
	
	# Generar relaciones de predecesor según la proporción
	num_predecesores = int(num_contenidos * proporcion_predecesores)
	predecesores = set()
	while len(predecesores) < num_predecesores:
		X, Y = random.sample(contenidos, 2)
		idx_X = int(X.split("_")[1])  # Extraer el índice del contenido
		idx_Y = int(Y.split("_")[1])  # Extraer el índice del contenido
		if idx_X < idx_Y:  # Solo permitir predecesores si X precede a Y
			predecesores.add((X, Y))  
	
	# Identificar contenidos sin predecesores
	sin_predecesores = {c for c in contenidos if all(c != p[1] for p in predecesores)}
	
	# Generar grupos independientes de paralelos usando solo contenidos sin predecesores
	paralelas = []
	contenidos_disponibles = sin_predecesores  # Usar solo contenidos sin predecesores
	for _ in range(num_grupos_paralelas):
		if len(contenidos_disponibles) < 2:
			break
		# Crear un grupo de paralelos con un tamaño máximo especificado
		grupo = random.sample(list(contenidos_disponibles), min(len(contenidos_disponibles), max_paralelas_por_grupo))
		paralelas.append(grupo)
		# Remover este grupo de los contenidos disponibles para garantizar independencia
		contenidos_disponibles -= set(grupo)

	duraciones = {}

	for grupo in paralelas:
		while True:
			# Generar duraciones iniciales entre 10 y 200
			duraciones_grupo = [random.randint(10, 200) for _ in grupo]
			
			# Asegurar que la suma total no exceda los 400 minutos
			if sum(duraciones_grupo) <= 400:
				# Intentar dividir en dos bloques de ≤ 200 minutos
				bloque_1, bloque_2 = [], []
				duraciones_grupo_sorted = sorted(duraciones_grupo, reverse=True)
				
				# Asignar los contenidos a los bloques de manera más controlada
				for duracion in duraciones_grupo_sorted:
					if sum(bloque_1) + duracion <= 200:
						bloque_1.append(duracion)
					elif sum(bloque_2) + duracion <= 200:
						bloque_2.append(duracion)
					else:
						# Si no cabe en ninguno de los bloques, romper y generar nuevas duraciones
						break
				
				# Verificar si los dos bloques cumplen con la restricción
				if len(bloque_1)+ len(bloque_2) == len(duraciones_grupo):
					# Si se cumple, asignar las duraciones al grupo
					for contenido, duracion in zip(grupo, duraciones_grupo):
						duraciones[contenido] = duracion
					break  # Salir del ciclo para el grupo actual
				else:
					continue

	
	
	# Identificar contenidos sin paralelas
	sin_paralelas = {c for c in contenidos if all(c not in grupo for grupo in paralelas)}
		
	# Escribir el archivo PDDL
	with open(nombre_archivo, 'w') as file:
		file.write("(define (problem problema_generado)\n\n")
		file.write("    (:domain SeriesPelisExt4)\n\n")
		file.write("    (:objects\n")
		file.write("        " + " ".join(contenidos) + "\n    )\n\n")
		file.write("    (:init\n")
		
		# Añadir predecesores
		for X, Y in predecesores:
			file.write(f"        (predecesor {X} {Y})\n")
		
		# Añadir paralelas (grupos independientes)
		for grupo in paralelas:
			for i in range(len(grupo)):
				for j in range(i + 1, len(grupo)):
					file.write(f"        (paralela {grupo[i]} {grupo[j]})\n")
					file.write(f"        (paralela {grupo[j]} {grupo[i]})\n")
			 # Añadir predicado de duración para cada contenido del grupo
			for contenido in grupo:
				file.write(f"        (= (minutos_contenido {contenido}) {duraciones[contenido]})\n")
			
		# Añadir predicados 'paralelas_vistas' para contenidos sin paralelas
		for c in sin_paralelas:
			file.write(f"        (paralelas_vistas {c})\n")
			file.write(f"        (no_paralela {c})\n")
		
		# Añadir predicados 'predecesores_vistos' para contenidos sin predecesores
		for c in sin_predecesores:
			file.write(f"        (predecesores_vistos {c})\n")
		
		
		# Añadir inicialización
		file.write("        (paralelas_ok)\n")
		file.write("        (= (minutos_vistos) 0)\n")
		file.write("    )\n\n")
		
		# Añadir el objetivo
		file.write("    (:goal \n")
		file.write("        (forall (?c) (visto ?c))\n")
		file.write("    )\n")
		file.write(")\n")

# Ejemplo de uso
seed = 123
num_contenidos = 200
proporcion_predecesores = 0.7  # Proporción de contenidos con relaciones de predecesor
num_grupos_paralelas = 10     # Número de grupos de paralelos
max_paralelas_por_grupo = 4   # Máximo de paralelas por grupo
nombre_archivo = "Practica-problem35Ext4.pddl"

generar_pddl(seed, num_contenidos, proporcion_predecesores, num_grupos_paralelas, max_paralelas_por_grupo, nombre_archivo)
