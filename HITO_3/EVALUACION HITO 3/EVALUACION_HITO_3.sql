CREATE DATABASE DEFENSA_HITO3_UNIFRANZITOS;
USE DEFENSA_HITO3_UNIFRANZITOS;

CREATE TABLE CAMPEONATO(
id_CAMPEONATO VARCHAR(12) PRIMARY KEY,
NOMBRE_CAMPEONATO VARCHAR(30) NOT NULL,
SEDE VARCHAR(20) NOT NULL
);

CREATE TABLE EQUIPO(
id_EQUIPO VARCHAR(12) PRIMARY KEY,
NOMBRE_EQUIPO VARCHAR(30) NOT NULL,
CATEGORIA VARCHAR(15) NOT NULL,
id_CAMPEONATO VARCHAR(12),
FOREIGN KEY (id_CAMPEONATO) REFERENCES CAMPEONATO (id_CAMPEONATO)
);

CREATE TABLE JUGADOR(
id_JUGADOR VARCHAR(12) PRIMARY KEY,
NOMBRES VARCHAR(30) NOT NULL,
APELLIDOS VARCHAR(30) NOT NULL,
ci VARCHAR(15) NOT NULL,
EDAD INTEGER,
id_EQUIPO VARCHAR(12),
FOREIGN KEY (id_EQUIPO) REFERENCES EQUIPO (id_EQUIPO)
);

INSERT INTO CAMPEONATO (id_CAMPEONATO,NOMBRE_CAMPEONATO,SEDE)
VALUES('camp-111','Campeonato Unifranz','El Alto')
,('camp-222','Campeonato Unifranz','Cochabamba');

INSERT INTO EQUIPO(id_EQUIPO,NOMBRE_EQUIPO,CATEGORIA,id_CAMPEONATO)
VALUES('equ-111','Google','varones','camp-111')
,('equ-222','404 Not found','varones','camp-111'),
('equ-333','girls unifranz','mujeres','camp-111');

INSERT INTO JUGADOR (id_JUGADOR,NOMBRES,APELLIDOS,CI,EDAD,id_EQUIPO)
VALUES('jug-111','Carlos','Villa','8997811LP',19,'equ-222'),
('jug-222','Pedro','Salas','8997822LP',20,'equ-222'),
('jug-333','Saul','Araj','8997833LP',21,'equ-222'),
('jug-444','Sandra','Solis','8997844LP',20,'equ-333'),
('jug-555','Ana','Mica','8997855LP',23,'equ-333');

select* from CAMPEONATO;
select* from EQUIPO;
select* from JUGADOR;

--1
SELECT jug.NOMBRES, jug.APELLIDOS
FROM JUGADOR AS jug
INNER JOIN EQUIPO AS eq on jug.id_EQUIPO= eq.id_EQUIPO
where eq.id_EQUIPO='equ-222';
--2
SELECT jug.NOMBRES, jug.APELLIDOS
FROM JUGADOR AS jug
INNER JOIN EQUIPO AS eq on jug.id_EQUIPO= eq.id_EQUIPO
INNER JOIN CAMPEONATO AS cam on eq.id_CAMPEONATO= cam.id_CAMPEONATO
where cam.SEDE='El Alto';
--3
SELECT jug.NOMBRES, jug.APELLIDOS,jug.EDAD
FROM JUGADOR AS jug
INNER JOIN EQUIPO AS eq on jug.id_EQUIPO= eq.id_EQUIPO
where jug.EDAD >=20 and eq.CATEGORIA = 'varones';
--4
SELECT jug.NOMBRES, jug.APELLIDOS
FROM JUGADOR AS jug
INNER JOIN EQUIPO AS eq on jug.id_EQUIPO= eq.id_EQUIPO
where jug.APELLIDOS like 'S%';
--5
SELECT eq.NOMBRE_EQUIPO
FROM JUGADOR AS jug
INNER JOIN EQUIPO AS eq on jug.id_EQUIPO= eq.id_EQUIPO
INNER JOIN CAMPEONATO AS cam on eq.id_CAMPEONATO= cam.id_CAMPEONATO
where cam.id_CAMPEONATO='camp-111' and eq.CATEGORIA='mujeres';
--6
SELECT eq.NOMBRE_EQUIPO
FROM JUGADOR AS jug
INNER JOIN EQUIPO AS eq on jug.id_EQUIPO= eq.id_EQUIPO
where jug.id_JUGADOR= 'jug-333';
--7
SELECT cam.NOMBRE_CAMPEONATO
FROM JUGADOR AS jug
INNER JOIN EQUIPO AS eq on jug.id_EQUIPO= eq.id_EQUIPO
INNER JOIN CAMPEONATO AS cam on eq.id_CAMPEONATO= cam.id_CAMPEONATO
where jug.id_JUGADOR= 'jug-333';
--8
SELECT cam.SEDE,eq.NOMBRE_EQUIPO, jug.NOMBRES, JUG.EDAD
FROM JUGADOR AS jug
INNER JOIN EQUIPO AS eq on jug.id_EQUIPO= eq.id_EQUIPO
INNER JOIN CAMPEONATO AS cam on eq.id_CAMPEONATO= cam.id_CAMPEONATO
where eq.NOMBRE_EQUIPO LIKE '%z' and jug.EDAD = 20;
--9
SELECT COUNT(*) NUMERO_DE_EQUIPOS
FROM EQUIPO AS eq
--10
--para varones
SELECT COUNT(*) NUMERO_DE_JUGADORES
FROM EQUIPO AS eq
inner join JUGADOR AS jug ON jug.id_EQUIPO = eq.id_EQUIPO
WHERE eq.CATEGORIA = 'varones'
-- para mujeres
SELECT COUNT(*) NUMERO_DE_JUGADORES_MUJERES
FROM EQUIPO AS eq
inner join JUGADOR AS jug ON jug.id_EQUIPO = eq.id_EQUIPO
WHERE eq.CATEGORIA = 'mujeres'

