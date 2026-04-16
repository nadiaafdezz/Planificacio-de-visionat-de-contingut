import random

def create_pddl_file():
    """
    Genera un archivo .pddl que distribuye contenidos en grupos, asegurando que la suma de 
    los minutos_contenido en cada grupo no exceda 400 minutos y agrega una cabecera inicial.
    """
    # Solicitar la semilla para reproducibilidad
    seed = int(input("Introduce una semilla para generar las duraciones aleatorias: "))
    random.seed(seed)

    # Solicitar el número de grupos
    num_groups = int(input("¿Cuántos grupos de paralelas quieres crear?: "))
    
    # Solicitar el número máximo de contenidos por grupo
    max_contents = int(input("¿Cuál es el número máximo de contenidos por grupo?: "))
    if max_contents < 2:
        print("El número máximo de contenidos debe ser al menos 2.")
        return

    duration_range = (60, 120)  # Rango de minutos por contenido
    groups = []  # Lista para almacenar los grupos
    all_contents = []  # Lista para rastrear todos los contenidos creados

    # Crear los grupos
    for group_num in range(1, num_groups + 1):
        while True:
            num_contents = random.randint(2, max_contents)
            group = [f"contenido_{len(all_contents) + i + 1}" for i in range(num_contents)]
            durations = [random.randint(*duration_range) for _ in group]
            total_duration = sum(durations)

            if total_duration <= 400:
                groups.append((group, durations))
                all_contents.extend(group)
                break

    # Crear archivo .pddl
    filename = "contenido.pddl"
    with open(filename, 'w') as file:
        # Escribir cabecera
        file.write("(define (problem problema2)\n\n")
        file.write("    (:domain SeriesPelisExt4)\n\n")
        file.write("    (:objects\n")
        file.write("        " + " ".join(all_contents) + "\n")
        file.write("    )\n\n")

        # Escribir init
        file.write("    (:init\n")
        
        # Escribir grupos de paralelas y duraciones
        for group_num, (group_contents, durations) in enumerate(groups, start=1):
            file.write(f"        ;; grupo {group_num}\n")
            # Relaciones paralelas
            for i in range(len(group_contents)):
                for j in range(len(group_contents)):
                    if i != j:
                        file.write(f"        (paralela {group_contents[i]} {group_contents[j]})\n")
            # Duraciones
            for content, duration in zip(group_contents, durations):
                file.write(f"        (=(minutos_contenido {content}) {duration})\n")

        # Escribir condiciones iniciales
        file.write("        (paralelas_ok)\n")
        file.write("        (= (minutos_vistos) 0)\n")
        file.write("    )\n)")
        file.write("(:goal (forall (?c) (visto ?c)))")

    print(f"Archivo '{filename}' creado con éxito. Usando semilla: {seed}")

# Ejecutar la función
create_pddl_file()
