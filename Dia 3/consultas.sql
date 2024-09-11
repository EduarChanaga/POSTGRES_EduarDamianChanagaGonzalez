-- Consultas sobre una tabla

-- 1. Devuelve un listado con el primer apellido, segundo apellido y el nombre de
--todos los alumnos. El listado deberá estar ordenado alfabéticamente de
-- menor a mayor por el primer apellido, segundo apellido y nombre.
select p.nombre,p.apellido1,p.apellido2  from persona p where tipo = 'alumno' order by p.apellido1,p.apellido2,p.nombre;

-- 2. Averigua el nombre y los dos apellidos de los alumnos que no han dado de
-- alta su número de teléfono en la base de datos.
select * from persona p where telefono is null and tipo = 'alumno';

-- 3. Devuelve el listado de los alumnos que nacieron en 1999.
select * from persona p WHERE EXTRACT(YEAR FROM p.fecha_nacimiento) = 1999;

-- 4. Devuelve el listado de profesores que no han dado de alta su número de
-- teléfono en la base de datos y además su nif termina en K.
select * from persona p where telefono is null and tipo = 'profesor' and nif like '%k';

-- 5. Devuelve el listado de las asignaturas que se imparten en el primer
-- cuatrimestre, en el tercer curso del grado que tiene el identificador 7.
select * from asignatura a where cuatrimestre = 1 and curso = 3 and id_grado 7;

-- Consultas multitabla (Composición interna)
-- 1. Devuelve un listado con los datos de todas las alumnas que se han
-- matriculado alguna vez en el Grado en Ingeniería Informática (Plan 2015).
SELECT * 
FROM persona p 
INNER JOIN alumno_se_matricula_asignatura asma ON p.id = asma.id_alumno 
inner join asignatura a on a.id = asma.id_asignatura
WHERE p.tipo = 'alumno' and a.nombre = 'Ingeniería Informática';

-- 2. Devuelve un listado con todas las asignaturas ofertadas en el Grado en
-- Ingeniería Informática (Plan 2015).
select * from asignatura a;
select * from grado g;

-- 3. Devuelve un listado de los profesores junto con el nombre del
-- departamento al que están vinculados. El listado debe devolver cuatro
-- columnas, primer apellido, segundo apellido, nombre y nombre del
-- departamento. El resultado estará ordenado alfabéticamente de menor a
-- mayor por los apellidos y el nombre.
-- 4. Devuelve un listado con el nombre de las asignaturas, año de inicio y año de
-- fin del curso escolar del alumno con nif 26902806M.
-- 5. Devuelve un listado con el nombre de todos los departamentos que tienen
-- profesores que imparten alguna asignatura en el Grado en Ingeniería
-- Informática (Plan 2015).
-- 6. Devuelve un listado con todos los alumnos que se han matriculado en
-- alguna asignatura durante el curso escolar 2018/2019.