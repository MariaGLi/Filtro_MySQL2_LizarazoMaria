DROP DATABASE IF EXISTS La_Universitaria_Maria;
CREATE DATABASE La_Universitaria_Maria;

USE La_Universitaria_Maria;

CREATE TABLE Departamento(
id INT (10) primary key,
Nombre varchar(50) not null
);

CREATE TABLE Profesor (
id INT (10) primary key,
Nif varchar(9),
Nombre varchar(25) not null,
Apellido1 varchar(50) not null,
Apellido2 varchar(50),
Ciudad varchar(25) not null,
Direccion varchar(50) not null,
Telefono varchar(9),
Fecha_nacimiento DATE,
Sexo ENUM ('H', 'M') NOT NULL,
id_departamento int,
foreign key (id_departamento) references Departamento (id)
);

CREATE TABLE Grado(
id INT(10) primary key,
Nombre varchar(100) not null
);

CREATE TABLE Asignatura (
id INT primary key,
Nombre varchar(100) not null,
Creditos float not null,
Tipo ENUM('Básica', 'Obligatoria', 'Optativa') not null,
Curso tinyint(3) not null,
Cuatrimestre tinyint(3) not null,
id_profesor int,
id_grado int,
foreign key (id_profesor) references Profesor (id),
foreign key (id_grado) references Grado (id)
);

CREATE TABLE Curso_escolar (
id int(10) primary key,
Anyo_inicio YEAR(4),
Anyo_fin YEAR(4)
);

CREATE TABLE Alumno (
id INT (10) primary key,
Nif varchar(9),
Nombre varchar(25) not null,
Apellido1 varchar(50) not null,
Apellido2 varchar(50),
Ciudad varchar(25) not null,
Direccion varchar(50) not null,
Telefono varchar(9),
Fecha_nacimiento DATE,
Sexo ENUM ('H', 'M') NOT NULL
);

CREATE TABLE Alumno_se_matricula_asignatura(
id_alumno int,
id_asignatura int,
id_curso_escolar int,
foreign key (id_alumno) references Alumno (id),
foreign key (id_asignatura) references Asignatura (id),
foreign key (id_curso_escolar) references Curso_escolar (id)
);