--CONSULTAS SIMPLES
--Todas las armas de tipo espada
SELECT * FROM Arma WHERE Tipo = 'Sword';

--Partidas con una duración superior a 60 horas
SELECT * FROM Partida WHERE Duracion > 60;

--Consulta de Enemigos en un Mapa determinado:
SELECT Nombre, Tipo, Fuerza
FROM Enemigo
WHERE Mapa_ID_Sitio = 1;


--CONSULTAS COMPUESTAS:
--Consulta de Enemigos y Bosses
--Justificación: Proporciona información sobre los enemigos y bosses.
SELECT E.Nombre AS Enemigo, E.Tipo AS TipoEnemigo, B.NFases, B.Acto
FROM Enemigo E
LEFT JOIN Boss B ON E.ID_Enemigo = B.Enemigo_ID_Enemigo;

--Consulta de Armaduras con Pasiva y su Rareza:
--Justificación: Ofrece información detallada sobre las armaduras que tienen una habilidad pasiva y su rareza asociada
SELECT A.Nombre, A.Pasiva, O.Rareza
FROM Armadura A
INNER JOIN Objeto O ON A.Objeto_ID_Objeto = O.ID_Objeto
WHERE A.Pasiva IS NOT NULL;

--CONSULTAS AGRUPADAS:
--Contar la cantidad de enemigos por tipo
SELECT Tipo, COUNT(*) as Cantidad_Enemigos
FROM Enemigo
GROUP BY Tipo;

--Promedio del nivel de los personajes por raza
SELECT Raza, ROUND(AVG(Nivel), 2) as Promedio_Nivel
FROM Personaje
GROUP BY Raza;

--Consulta del Promedio de Fuerza por Tipo de Enemigo:
SELECT Tipo, ROUND(AVG(Fuerza), 2) AS FuerzaPromedio
FROM Enemigo
GROUP BY Tipo;

--Consulta del Promedio de Defensa por Rareza de Armadura:
--Justificación: Muestra el promedio de defensa de las armaduras agrupadas por rareza.
SELECT O.Rareza, ROUND(AVG(A.Defensa), 2) AS DefensaPromedio
FROM Armadura A
INNER JOIN Objeto O ON A.Objeto_ID_Objeto = O.ID_Objeto
GROUP BY O.Rareza
