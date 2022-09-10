PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "Materias" (idMateria INTEGER PRIMARY KEY AUTOINCREMENT, Materia TEXT, Eliminado INTEGER);
INSERT INTO Materias VALUES(1,'Informatica',NULL);
CREATE TABLE Asignaturas
(idAsignatura INTEGER PRIMARY KEY AUTOINCREMENT, 
Asignatura TEXT NOT NULL UNIQUE,
MateriaAsignatura INTEGER NOT NULL, Eliminado INTEGER, 
FOREIGN KEY (MateriaAsignatura) REFERENCES Materias(idMateria));
INSERT INTO Asignaturas VALUES(1,'Programacion',1,NULL);
CREATE TABLE Estudiantes (idEstudiante INTEGER PRIMARY KEY AUTOINCREMENT,
Documento TEXT NOT NULL UNIQUE, 
Nombre TEXT NOT NULL,
Apellido TEXT NOT NULL,
FechaNacimiento TEXT, Edad INTEGER,
FechaIngreso TEXT, Eliminado INTEGER);
INSERT INTO Estudiantes VALUES(1,'12341234','Vladimir','Rodriguez',NULL,32,'2022-06-15',NULL);
CREATE TABLE IF NOT EXISTS "Cursos"(
idCurso INTEGER PRIMARY KEY AUTOINCREMENT, 
Nombre TEXT NOT NULL,
AsignaturaCurso INTEGER NOT NULL, Docente INTEGER REFERENCES Docentes(id_docente), Puntaje INTEGER, Asignatura INTEGER, Edicion INTEGER, Anno INTEGER, Estado TEXT,
FOREIGN KEY (AsignaturaCurso) REFERENCES Asignaturas(idAsignatura));
INSERT INTO Cursos VALUES(1,'Java',1,NULL,NULL,NULL,NULL,NULL,NULL);
CREATE TABLE InscripcionesCursos (idInscripcionesCurso INTEGER PRIMARY KEY AUTOINCREMENT,
EstudianteInscrito INTEGER NOT NULL,
CursoInscrito INTEGER NOT NULL,
FOREIGN KEY (EstudianteInscrito) REFERENCES Estudiantes(idEstudiante),
FOREIGN KEY (CursoInscrito) REFERENCES "Cursos"(IdCurso));
INSERT INTO InscripcionesCursos VALUES(1,1,1);
CREATE TABLE Docentes (
id_docente INTEGER PRIMARY KEY AUTOINCREMENT, Nombre TEXT, Apellido TEXT,
Documento TEXT NOT NULL UNIQUE, FNac TEXT, Edad INTEGER, Grado INTEGER,
FIngreso INTEGER, Eliminado INTEGER);
CREATE TABLE Examenes (
id_examen INTEGER PRIMARY KEY AUTOINCREMENT, Curso INTEGER, Fecha TEXT, Eliminado INTEGER, 
FOREIGN KEY (Curso) REFERENCES Cursos(idCurso));
CREATE TABLE RendicionesExamen (
id_rendicionesExamen INTEGER PRIMARY KEY AUTOINCREMENT, Examen INTEGER, Inscripcion INTEGER,
Nota INTEGER, Eliminado INTEGER, 
FOREIGN KEY (Examen) REFERENCES Examenes(id_examen),
FOREIGN KEY (Inscripcion) REFERENCES InscripcionesCursos(idInscripcionesCurso));
DELETE FROM sqlite_sequence;
INSERT INTO sqlite_sequence VALUES('Materias',1);
INSERT INTO sqlite_sequence VALUES('Asignaturas',1);
INSERT INTO sqlite_sequence VALUES('Cursos',1);
INSERT INTO sqlite_sequence VALUES('Estudiantes',1);
INSERT INTO sqlite_sequence VALUES('InscripcionesCursos',1);
COMMIT;
1|Informatica|
1|Informatica|
PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "Materias" (idMateria INTEGER PRIMARY KEY AUTOINCREMENT, Materia TEXT, Eliminado INTEGER);
INSERT INTO Materias VALUES(1,'Informatica',NULL);
CREATE TABLE Asignaturas
(idAsignatura INTEGER PRIMARY KEY AUTOINCREMENT, 
Asignatura TEXT NOT NULL UNIQUE,
MateriaAsignatura INTEGER NOT NULL, Eliminado INTEGER, 
FOREIGN KEY (MateriaAsignatura) REFERENCES Materias(idMateria));
INSERT INTO Asignaturas VALUES(1,'Programacion',1,NULL);
CREATE TABLE Estudiantes (idEstudiante INTEGER PRIMARY KEY AUTOINCREMENT,
Documento TEXT NOT NULL UNIQUE, 
Nombre TEXT NOT NULL,
Apellido TEXT NOT NULL,
FechaNacimiento TEXT, Edad INTEGER,
FechaIngreso TEXT, Eliminado INTEGER);
INSERT INTO Estudiantes VALUES(1,'12341234','Vladimir','Rodriguez',NULL,32,'2022-06-15',NULL);
CREATE TABLE IF NOT EXISTS "Cursos"(
idCurso INTEGER PRIMARY KEY AUTOINCREMENT, 
Nombre TEXT NOT NULL,
AsignaturaCurso INTEGER NOT NULL, Docente INTEGER REFERENCES Docentes(id_docente), Puntaje INTEGER, Asignatura INTEGER, Edicion INTEGER, Anno INTEGER, Estado TEXT,
FOREIGN KEY (AsignaturaCurso) REFERENCES Asignaturas(idAsignatura));
INSERT INTO Cursos VALUES(1,'Java',1,NULL,NULL,NULL,NULL,NULL,NULL);
CREATE TABLE InscripcionesCursos (idInscripcionesCurso INTEGER PRIMARY KEY AUTOINCREMENT,
EstudianteInscrito INTEGER NOT NULL,
CursoInscrito INTEGER NOT NULL,
FOREIGN KEY (EstudianteInscrito) REFERENCES Estudiantes(idEstudiante),
FOREIGN KEY (CursoInscrito) REFERENCES "Cursos"(IdCurso));
INSERT INTO InscripcionesCursos VALUES(1,1,1);
CREATE TABLE Docentes (
id_docente INTEGER PRIMARY KEY AUTOINCREMENT, Nombre TEXT, Apellido TEXT,
Documento TEXT NOT NULL UNIQUE, FNac TEXT, Edad INTEGER, Grado INTEGER,
FIngreso INTEGER, Eliminado INTEGER);
CREATE TABLE Examenes (
id_examen INTEGER PRIMARY KEY AUTOINCREMENT, Curso INTEGER, Fecha TEXT, Eliminado INTEGER, 
FOREIGN KEY (Curso) REFERENCES Cursos(idCurso));
CREATE TABLE RendicionesExamen (
id_rendicionesExamen INTEGER PRIMARY KEY AUTOINCREMENT, Examen INTEGER, Inscripcion INTEGER,
Nota INTEGER, Eliminado INTEGER, 
FOREIGN KEY (Examen) REFERENCES Examenes(id_examen),
FOREIGN KEY (Inscripcion) REFERENCES InscripcionesCursos(idInscripcionesCurso));
DELETE FROM sqlite_sequence;
INSERT INTO sqlite_sequence VALUES('Materias',1);
INSERT INTO sqlite_sequence VALUES('Asignaturas',1);
INSERT INTO sqlite_sequence VALUES('Cursos',1);
INSERT INTO sqlite_sequence VALUES('Estudiantes',1);
INSERT INTO sqlite_sequence VALUES('InscripcionesCursos',1);
COMMIT;
