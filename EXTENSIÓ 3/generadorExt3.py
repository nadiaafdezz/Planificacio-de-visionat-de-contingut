import random

def generar_pddl(seed, num_contenidos, proporcion_predecesores, num_grupos_paralelas, max_paralelas_por_grupo, nombre_archivo):
    random.seed(seed)
    
    # Generar nombres aleatorios para los contenidos
    contenidos = [f"contenido_{i}" for i in range(1, num_contenidos + 1)]
    
    # Generar relaciones de predecesor según la proporción
    num_predecesores = int(num_contenidos * proporcion_predecesores)
    predecesores = set()
    while len(predecesores) < num_predecesores:
        X, Y = random.sample(contenidos, 2)
        if (X, Y) not in predecesores and X != Y:
            predecesores.add((X, Y))
    
    # Generar grupos independientes de paralelos
    paralelas = []
    contenidos_disponibles = set(contenidos)
    for _ in range(num_grupos_paralelas):
        if len(contenidos_disponibles) < 2:
            break
        # Crear un grupo de paralelos con un tamaño máximo especificado
        grupo = random.sample(list(contenidos_disponibles), min(len(contenidos_disponibles), max_paralelas_por_grupo))
        paralelas.append(grupo)
        # Remover este grupo de los contenidos disponibles para garantizar independencia
        contenidos_disponibles -= set(grupo)
    
    # Identificar contenidos finales (sin paralelas ni predecesores)
    contenidos_finales = [
        c for c in contenidos
        if c not in {p[0] for p in predecesores}  # No es predecesor de nadie
        and all(c not in grupo for grupo in paralelas)  # No tiene paralelas
    ]
    
    # Escribir el archivo PDDL
    with open(nombre_archivo, 'w') as file:
        file.write("(define (problem problema_generado)\n\n")
        file.write("    (:domain SeriesPelisExt3)\n\n")
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
        
        # Añadir contenidos finales
        for c in contenidos_finales:
            file.write(f"        (final {c})\n")
        
        # Añadir inicialización
        file.write("        (paralelas_ok)\n")
        file.write("        (= (contenidos_vistos) 0)\n")
        file.write("    )\n\n")
        
        # Añadir el objetivo
        file.write("    (:goal \n")
        file.write("        (forall (?c) (visto ?c))\n")
        file.write("    )\n")
        file.write(")\n")

# Ejemplo de uso
seed = 1234
num_contenidos = 15
proporcion_predecesores = 0.5  # 30% de los contenidos tendrán relaciones de predecesor
num_grupos_paralelas = 2      # Número de grupos de paralelos
max_paralelas_por_grupo = 4   # Máximo de paralelas por grupo
nombre_archivo = "problema_generado.pddl"

generar_pddl(seed, num_contenidos, proporcion_predecesores, num_grupos_paralelas, max_paralelas_por_grupo, nombre_archivo)
