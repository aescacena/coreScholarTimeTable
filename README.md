

# Problema 
Se divide el problema en 2 partes.
- Asignación de cargas académicas
- Asignación de horarios

## Asignación de cargas académicas
### Datos de entrada
- Asignaturas a impartir
- Número máximo de asignaturas y horas de cada profesor
- Preferencias de asignaturas de cada profesor

### Restricciones duras
- Todas las asignaturas deben ser impartidas, cada una por un profesor.
- No se puede superar el límite de asignaturas asignadas para un profesor en el periodo escolar.
- No se puede superar el límite de horas a impartir para un profesor
- Todos los profesores deben impartir al menos una asignatura en el periodo escolar

### Restricciones blandas
- Un profesor solo debe impartir asignaturas entre sus preferencias

### Modelo matemático
- n profesores T = {t1, t2,..., tn}
- m asignaturas A = {a1, a2,..., an}
- Nº sesiones por asignatura S = {s1, s2,..., sn}
- Matriz de restricciones de tiempo y asignaturas para cada profesor R2xn
- Matriz de preferencias de cada una de las asignaturas para cada profesor Pnxm

La función objetivo que se desea optimizar es máximizar la suma de las preferencias de cada una de las asignaturas que impartirá cada profesor.

## Asignación de horarios
### Datos de entrada
- Profesores, asignaturas, cursos y asignaturas por curso
- Asignaturas que imparte cada profesor
- Asignaturas que no pueden ser programadas a la misma hora (por que tienen estudiantes en común)
- Duración de cada asignatura
- Aulas disponibles
- Horario disponible de los profesores para impartir clases.

### Restricciones duras
- Un profesor solo puede impartir una asignatura a la vez
- No pueden programarse a la misma hora asignaturas diferentes con el mismo grupo de estudiantes
- Cada asignatura debe impartirse el número de veces y en días diferentes necesarios para cubrir las horas requeridas. Es decir no pueden programarse continuas o para un mismo día.
- Deben programarse todas las asignaturas.

### Restricciones blandas
- (No lo entiendo bien) ¿Los periodos 4 y 5 del dia solo deben emprease en caso necesario, es deseable no utilizarlos para programar eventos?
- Respetar disponibilidad de horarios de profesores, para impartir sus clases.

### Modelo matemático
- n Materias E = {e1, e2,..., en} donde cada ei consta de si sesiones
- c Periodos P = {p1, p2,..., pc}
- m Profesores T = {t1, t2,..., tm}
- r Aulas A = {a1, a2,..., ar}
- s Grupos G = {g1, g2,..., gs}
- 2 Turnos: 
  - 0: Mañana
  - 1: Tarde
- Un vector de turnos por grupo V = {v1, v2,..., vs}
- Matriz binaria de Materias por Grupos: Dnxs. Donde Dij = 1 si el grupo j asiste a la materia i
- Matriz binaria de materias por Profesores: Cnxs. Donde Cij = 1 si el maestro j imparte la materia i
- Variable Xijk la representación de la materia i asignada al aula j en el periodo k.
    - 0: No existe asignación.
    - 1: Existe asignación.

### Función objetivo
Satisfacer todas las restricciones duras y la mayor cantidad de restricciones suaves posibles.

