
def generar_pddl_solo_predecesores_y_no_paralelas(seed, num_contenidos, proporcion_predecesores, nombre_archivo):
    import random  # Aseguramos que random esté importado
    
    random.seed(seed)
    
    # Generar nombres aleatorios para los contenidos
    contenidos = [f"contenido_{i}" for i in range(1, num_contenidos + 1)]
    
    # Generar duraciones aleatorias para cada contenido (entre 60 y 120 minutos por contenido)
    duraciones = {contenido: random.randint(60, 120) for contenido in contenidos}
    
    # Generar relaciones de predecesor según la proporción
    num_predecesores = int(num_contenidos * proporcion_predecesores)
    predecesores = set()
    while len(predecesores) < num_predecesores:
        X, Y = random.sample(contenidos, 2)
        idx_X = int(X.split("_")[1])  # Extraer el índice del contenido
        idx_Y = int(Y.split("_")[1])  # Extraer el índice del contenido
        if idx_X < idx_Y:  # Solo permitir predecesores si X precede a Y
            predecesores.add((X, Y))
    
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
        
        # Marcar todos los contenidos como no paralelos
        for contenido in contenidos:
            file.write(f"        (no_paralela {contenido})\n")
        
        # Añadir duraciones de contenidos
        for contenido, duracion in duraciones.items():
            file.write(f"        (=(minutos_contenido {contenido}) {duracion})\n")
        
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
seed = 1234
num_contenidos = 195
proporcion_predecesores = 0.9  # 100% de los contenidos tendrán relaciones de predecesor
nombre_archivo = "problema_generado_ext4.pddl"

generar_pddl_solo_predecesores_y_no_paralelas(seed, num_contenidos, proporcion_predecesores, nombre_archivo)

