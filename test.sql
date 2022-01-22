drop table streets, people;

create table streets(

	id_streets serial primary key,
	name_street varchar(50),
	descripcion varchar(100)

);

create table people(

	id_people serial primary key,
	nombre varchar(50),
	descripcion varchar(100),
	edad int,
	fkStreet int references streets(id_streets)
);


--INSERCCION DE DATOS

insert into streets VALUES(1,'Calle Cafeteria','Calle frente a cafeteria cerca peatonal');
insert into streets VALUES(2,'Calle ICAS','Calle de salida/entrada a sultana');
insert into streets VALUES(3,'Calle Polideportivo','Calle frente a cafeteria cerca peatonal');
insert into streets VALUES(4,'Calle ICAS','Calle para ir a parqueo');
insert into streets VALUES(5,'Calle Cafeteria','Calle frente administracion');
insert into streets VALUES(6,'Calle Polideportivo','Calle frente a cancha');

insert into people VALUES(1,'Roberto Hernandez','Estudiante',23,1);
insert into people VALUES(2,'Cristiano Ronaldo','Jugador',40,1);
insert into people VALUES(3,'Lionel Messi','Jugador',38,2);
insert into people VALUES(4,'Usuario 4','Estudiante',50,3);
insert into people VALUES(5,'Usuario 5','Empleado',24,4);
insert into people VALUES(6,'Usuario 6','Estudiante',30,5);
insert into people VALUES(7,'Usuario 7','Empleado',28,6);
insert into people VALUES(8,'Usuario 8','Estudiante',26,1);
insert into people VALUES(9,'Usuario 9','Empleado',27,1);
insert into people VALUES(10,'Usuario 7','Empleado',30,6);
insert into people VALUES(11,'Usuario 8','Estudiante',50,1);
insert into people VALUES(12,'Usuario 9','Empleado',26,1);


-- CONSULTAS

select * from streets;
select * from people;

--1
select variable.nombre 
from people as variable
where variable.id_people=2;

--2
select count(x.id_streets) as "Total de Calles"
from streets as x;

--3
select count(*)
from people as y
where y.descripcion='Jugador';

--4
select y.descripcion, count(*)
from people as y
group by y.descripcion;

--5
select * 
from people as x, streets as y
where y.id_streets=x.fkStreet;

--6

select *
from people as x
where x.edad > 30 and x.edad < 50;

--7
select * 
from streets as y
where y.name_street = 'Calle ICAS' OR y.name_street = 'Calle Polideportivo'

--8 EJERCICIO
select count(x.edad) as "Respuesta"
from people as x
where x.edad>25 and x.edad <45

--ELIMINAR DATOS

delete from streets;
delete from people;

delete from people as y where y.id_people=3;
delete from streets as x where x.id_streets=2;





