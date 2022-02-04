-- CREA TOPOLOGIA EN RED, PUNTOS 

ALTER TABLE redvial_turin ADD COLUMN source integer;

ALTER TABLE redvial_turin ADD COLUMN target integer;

SELECT pgr_CreateTopology('redvial_turin', 0.001, 'geom','id');

-- AGREGA LONGITUD DE TRAMO Y COSTO

ALTER TABLE redvial_turin ADD column length double precision;

UPDATE redvial_turin SET length = st_length(geom)/1000;

ALTER TABLE redvial_turin ADD column cost double precision;

UPDATE redvial_turin SET cost = length/50*3600;

-- ALGORITMO DE JOHNSON 

SELECT start_vid AS nodo_inicio, end_vid AS nodo_final, agg_cost

AS coste_acumulado

FROM pgr_johnson('SELECT source, target, cost FROM redvial_turin');

-- ALGORITMO DE DIJKSTRA

SELECT seq, node AS nodo_origen, edge AS nodo_destino, cost AS

coste, agg_cost AS coste_acumulado

FROM pgr_dijkstra('SELECT id::integer, source::integer,

target::integer, cost::double precision FROM redvial_turin',

189, 160, false);
