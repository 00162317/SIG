--1. Indique el nombre del municipio que tenga geometría inválida.
SELECT m.nom_mun
FROM municipios m
WHERE ST_ISVALID(m.geom) = False

--2. ¿En qué sistema de referencia de coordenadas (SRC) está la capa de cantones?
SELECT ST_SRID(c.geom)
FROM cantones as c
LIMIT 1

--3. ¿Cuáles son las coordenadas de los volcanes activos en El Salvador?
SELECT v.nom, st_astext(v.geom) as coord
FROM volcanes v
WHERE v.status = 'Activo-histórico'

--4. ¿Qué área en km cuadrados tiene el lago de Coatepeque?

SELECT ST_Area(l.geom) AS area_lago
FROM lagos l
WHERE l.nom = 'LAGO DE COATEPEQUE';

--5. ¿Que distancia en línea recta hay entre en centro escolar CENTRO ESCOLAR "CANTON LAS GRANADILLAS" y el RIO LAS GRANADILLAS?
SELECT ST_distance(e.geom, r.geom)
FROM escuelas e, rios r
WHERE e.NOMBRE_CEN = 'CENTRO ESCOLAR "CANTON LAS GRANADILLAS"' and r.nom = 'RIO LAS GRANADILLAS'

--6. ¿Qué ríos o quebradas tienen una longitud menor a 1 km?
SELECT r.nom, r.geom, ST_length(r.geom) as longitud
FROM rios r
WHERE ST_length(r.geom) < 1000
ORDER BY longitud

--7. ¿Cuántos ríos o quebradas tienen una longitud menor a 1 km?

SELECT count(r.geom)
FROM rios r
WHERE ST_length(r.geom) < 1000

--8. 

--9. ¿Cómo se distribuyen espacialmente las escuelas ubicadas en municipios de pobreza severa?
SELECT m.cod_mun4, m.nom_mun, e.nombre_cen, e.geom
from escuelas as e, municipios as m
WHERE m.pobr_fisdl = 'Pobreza Severa'
      AND ST_WITHIN(e.geom, m.geom)
ORDER BY m.nom_mun ASC

--10. ¿Qué lagos son compartidos por varios municipios?
SELECT distinct(l.nom), l.geom
FROM lagos as l, municipios as m
WHERE ST_OVERLAPS(l.geom, m.geom)
ORDER BY l.nom

--11. ¿Qué escuelas del municipio Puerto de la Libertad están ubicadas en la zona de susceptibilidad a inundación del río Grande de Tamanique? 
--La zona de riesgo se ha delimitado como 700 m a cada lado del río.?
SELECT e.nombre_cen, e.geom
FROM escuelas as e, rios as r
WHERE e.municipio = 'LA LIBERTAD' AND r.nom = 'RIO GRANDE'
      AND ST_CONTAINS(ST_BUFFER(r.geom, 700), e.geom)
ORDER BY e.nombre_cen 

--12. ¿Qué escuelas del municipio Puerto de la Libertad están ubicadas en la zona de susceptibilidad a inundación del río Grande de Tamanique? 
--La zona de riesgo se ha delimitado como 700 m a cada lado del río.
SELECT e.nombre_cen, e.geom
FROM escuelas as e, rios as r
WHERE e.municipio = 'LA LIBERTAD' AND r.nom = 'RIO GRANDE'
      AND ST_DWITHIN(e.geom,r.geom, 700)
ORDER BY e.nombre_cen
