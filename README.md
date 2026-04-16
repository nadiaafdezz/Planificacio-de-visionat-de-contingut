# Planificador de Contenidos Audiovisuales (PDDL)
**Autors:** 
Nadia Fernández Domínguez

Paula Justo Gili

Júlia Pedrol Barberà

Jana Roman Garrido

---

Este proyecto desarrolla un sistema de **planificación automática** utilizando el lenguaje **PDDL** (*Planning Domain Definition Language*) para gestionar el visionado diario de películas y series. El sistema genera planes óptimos que respetan dependencias cronológicas, contenidos paralelos y restricciones temporales de visualización.

## Tabla de Contenidos
- [Introducción](#introducción)
- [Objetivos Principales](#objetivos-principales)
- [Descripción del Problema](#descripción-del-problema)
- [Extensiones del Proyecto](#extensiones-del-proyecto)
- [Generadores Aleatorios](#generadores-aleatorios)
- [Experimentación](#experimentación)
- [Tecnologías Utilizadas](#tecnologías-utilizadas)

---

## Introducción
El proyecto simula una aplicación de gestión de contenidos audiovisuales. El objetivo es generar planes de visualización que tengan en cuenta diversos tipos de restricciones, desde el orden cronológico de las sagas hasta los límites de tiempo disponibles por el usuario cada día.

## Objetivos Principales
1. **Comprender la Planificación Automática:** Uso de planificadores en el espacio de estados para generar soluciones óptimas.
2. **Modelado de Dominios:** Representación formal mediante predicados y acciones en PDDL.
3. **Desarrollo Incremental:** Evolución de un prototipo básico hacia soluciones sofisticadas con múltiples restricciones.
4. **Análisis de Rendimiento:** Evaluación del comportamiento de los algoritmos (Fast Forward y Metric-FF) ante problemas de diferentes escalas.

---

## Extensiones del Proyecto

El desarrollo se ha realizado de forma incremental, validando cada fase antes de pasar a la siguiente:

### Extensión Básica
- Planes con un máximo de un predecesor por contenido.
- Sin contenidos en paralelo.

### Extensión 1: Dependencias Múltiples
- Un contenido puede tener **N predecesores**.
- Uso del requisito `:adl` y cuantificación universal (`forall`) en las precondiciones.

### Extensión 2: Contenidos Paralelos
- Gestión de universos ficticios donde las historias ocurren simultáneamente.
- Restricción: los contenidos paralelos deben verse el mismo día o en días anteriores al contenido principal.

### Extensión 3: Límite de Cantidad
- Restricción de **máximo 3 contenidos al día**.
- Implementación de *fluents* para controlar el conteo diario.

### Extensión 4: Restricción Temporal
- Control de duración por minutos.
- Límite de **200 minutos de visionado diario**.
- Gestión de cambios de día automáticos basados en la carga temporal acumulada.

---

## Generadores Aleatorios
Para las extensiones más complejas (3 y 4), se han desarrollado generadores de problemas automáticos que permiten crear escenarios de prueba con:
- Solo predecesores.
- Solo paralelas.
- Combinación de ambas con proporciones ajustables (ej. 0.8 de predecesores).

## Experimentación
Se han realizado múltiples experimentos comparando el rendimiento de los algoritmos en función de la estructura del problema:
- **Impacto de la complejidad:** El tiempo de ejecución aumenta significativamente en la Extensión 4 debido al cálculo de los *fluents* numéricos y las restricciones de tiempo.
- **Validación:** Los planes generados respetan estrictamente el orden de los predecesores y no superan los límites diarios de minutos o cantidad establecidos.

---

## Tecnologías Utilizadas
- **PDDL:** Planning Domain Definition Language.
- **Planificadores:** - `Fast Forward (FF)` para las extensiones básicas.
  - `Metric-FF` para la gestión de restricciones numéricas (tiempo y cantidad).
- **Python:** Utilizado para la creación de los generadores de problemas aleatorios.

---
## Ejecución
Para ejecutar un problema con el planificador FF:
```
./ff -o dominio_ext4.pddl -f problema_ext4.pddl
```
Para la extensión 4 (con métricas):
```
./metric-ff -o dominio_ext4.pddl -f problema_ext4.pddl
```
