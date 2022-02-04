-- AGREGA SRC PERSONALIZADO LAMBERT CONFORME CÃ“NICO NAD27 A POSTGIS

INSERT into spatial_ref_sys (srid, auth_name, auth_srid, proj4text, srtext) values ( 100000, 'EPSG', 100000, '+proj=lcc +lat_1=13.31666666 +lat_2=14.25 +lat_0=13.78333333333333 +lon_0=-89 +x_0=500000 +y_0=295809.184 +k_0=0.999967040 +ellps=clrk66 +units=m +no_defs +towgs84=0,125,194,0,0,0,0', 'PROJCS["IDGES_rev",GEOGCS["GCS_North_American_1927" ,DATUM["D_North_American_1927",SPHEROID["Clarke_1866 ",6378206.4,294.9786982]],PRIMEM["Greenwich",0.0],UN IT["Degree",0.0174532925199433]],PROJECTION["Lambert _Conformal_Conic"],PARAMETER["False_Easting",500000. 0],PARAMETER["False_Northing",295809.184],PARAMETER[ "Central_Meridian",-89.0],PARAMETER["Standard_Parall el_1",13.31666666666667],PARAMETER["Standard_Parallel_2",14.25],PARAMETER["Scale_Factor",0.99996704],PARAMETER["Latitude_Of_Origin",13.783333],UNIT["Meter", 1.0]]');


-- ACTUALIZA EL SRC DE UNA CAPA, HAY QUE ACTUALIZAR EL NOMBRE DE LA CAPA CADA VEZ
-- Se tiene que sustituir el nombre de 'recvial' por el de la capa de interés

select updategeometrysrid('public','redvial','geom',100000);
