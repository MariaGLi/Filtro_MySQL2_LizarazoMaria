USE La_Universitaria_Maria;
-- Consultas

-- 1. Encuentra el profesor que ha impartido más asignaturas en el último año académico.

select p.Nombre, p.Apellido1, count(a.nombre) as Cant_Asignaturas from Profesor p
inner join Asignatura a on a.id_profesor = p.id group by 1,2 order by 3 DESC LIMIT 1;

-- 2. Lista los cinco departamentos con mayor cantidad de asignaturas asignadas.

select d.Nombre, count(a.id) as Cant_Asignaturas from Departamento d
inner join Profesor p on p.id_departamento = d.id
left join Asignatura a on a.id_profesor = p.id group by 1 limit 5;

-- 3. Obtén el total de alumnos y docentes por departamento.

select al.Nombre, count(al.id), count(p.id) from Alumno al
inner join Alumno_se_matricula_asignatura asma on asma.id_alumno = al.id
inner join Asignatura a on a.id = asma.id
inner join Profesor p on p.id_departamento = d.id 
inner join Departamento d on d.id = p.id_departamento group by 1;
-- No

-- 4. Calcula el número total de alumnos matriculados en asignaturas de un género específico en un semestre determinado.

select count(al.id); -- No

-- 5. Encuentra los alumnos que han cursado todas las asignaturas de un grado específico.

select distinct al.Nombre, asg.* from Alumno al
left join Alumno_se_matricula_asignatura asma on asma.id_alumno = al.id
inner join Asignatura asg on asg.id = asma.id_asignatura
inner join Grado g on g.id = asg.id_grado;

-- 6. Lista los tres grados con mayor número de asignaturas cursadas en el último semestre.

select distinct g.Nombre, a.Cuatrimestre, count(a.id) as Cant_Asignaturas from Grado g 
inner join Asignatura a on a.id_grado = g.id group by 1,2 order by 3 desc limit 3;

-- 7. Muestra los cinco profesores con menos asignaturas impartidas en el último año académico.

select p.Nombre, p.Apellido1, count(a.id) from Profesor p
left join Asignatura a on a.id_profesor = p.id group by 1,2 order by 3 asc limit 5;

-- 8. Calcula el promedio de edad de los alumnos al momento de su primera matrícula.

select  avg(ce.anyo_inicio - year(al.fecha_nacimiento)) as promedio_edad from alumno al
join alumno_se_matricula_asignatura asma on al.id = asma.id_alumno
join curso_escolar ce on ce.id = asma.id_curso_escolar;

-- 9. Encuentra los cinco profesores que han impartido más clases de un mismo grado.

select p.Nombre, p.Apellido1, g.Nombre, count(g.Nombre) from Profesor p
left join Asignatura a on a.id_profesor = p.id
right join Grado g on g.id = a.id_grado group by 1,2,3 order by 4 desc limit 5;

-- 10. Genera un informe con los alumnos que han cursado más de 10 asignaturas en el último año.

select distinct al.Nombre, al.Apellido1, a.Nombre, ce.Anyo_fin from Alumno al
inner join Alumno_se_matricula_asignatura asma on asma.id_alumno = al.id
inner join Asignatura a on a.id = asma.id_asignatura
inner join Curso_escolar ce on ce.id = asma.id_curso_escolar where Anyo_fin = 2018;

-- 11. Calcula el promedio de créditos de las asignaturas por grado.

select avg(a.Creditos), g.Nombre from Asignatura a
right join Grado g on g.id = a.id_grado group by 2 order by 1 desc;

-- 12. Lista las cinco asignaturas más largas (en horas) impartidas en el último semestre.
-- No
-- 13. Muestra los alumnos que han cursado más asignaturas de un género específico.

select al.Nombre, al.Apellido1, count(a.Curso) AS Cant_Cursos from Alumno al 
left join Alumno_se_matricula_asignatura asma on asma.id_alumno = al.id
right join Asignatura a on a.id = asma.id_asignatura where Sexo = 'H' group by 1,2;

-- 14. Encuentra la cantidad total de horas cursadas por cada alumno en el último semestre.
-- No
-- 15. Muestra el número de asignaturas impartidas diariamente en cada mes del último trimestre.

select count(Nombre) as Cant_Asig_Impartidas, Cuatrimestre from Asignatura where cuatrimestre = 2 group by 2 ;

-- 16. Calcula el total de asignaturas impartidas por cada profesor en el último semestre.

select a.Cuatrimestre, p.Nombre, p.Apellido1, count(a.Nombre) as Cant_Asig_Impartidas from Asignatura a
inner join Profesor p on p.id = a.id_profesor where cuatrimestre = 2 group by 1,2,3;

-- 17. Encuentra al alumno con la matrícula más reciente.

select distinct al.*, ce.* from Alumno al
inner join Alumno_se_matricula_asignatura asma on asma.id_alumno = al.id
inner join curso_escolar ce on ce.id = asma.id_curso_escolar order by Anyo_fin desc limit 1;

-- 18. Lista los cinco grados con mayor número de alumnos matriculados durante los últimos tres meses.

select g.*, count(al.Nombre) as Cant_Alumnos from Grado g 
left join Asignatura a on a.id_grado = g.id
left join Alumno_se_matricula_asignatura asma on asma.id_asignatura = a.id
left join Alumno al on al.id = asma.id_alumno group by 1 order by Cant_Alumnos desc limit 5;

-- 19. Obtén la cantidad de asignaturas cursadas por cada alumno en el último semestre.
-- 20. Lista los profesores que no han impartido clases en el último año académico.