

create database liga_bea;

go
use liga_bea;
go

-- creación de tablas

create table equipo(
identificador int not null,
nombre varchar(30) not null,
cif char(9) not null,
presupuesto float not null,
cod_division int not null, --foranea de division
num_campo int not null, --foranea de campo

constraint pk_equipo_identificador primary key (identificador),
constraint uq_equipo_nombre unique (nombre),
constraint uq_equipo_cif unique (cif),
constraint uq_equipo_num_campo unique (num_campo)
);

create table partido(

id_equipo_local int not null,
id_equipo_visitante int not null,
fecha_hora datetime not null,
observaciones varchar(150),

constraint pk_partido primary key (id_equipo_local, fecha_hora),

);

create table division(
codigo int not null,
nombre varchar(70) not null,
categoria char(4) null,

constraint pk_division_codigo primary key (codigo),
constraint uq_division_nombre unique (nombre)

);

create table campo(
numero int not null,
nombre varchar(100) not null,
capacidad int not null,

constraint pk_campo_numero primary key (numero),
constraint uq_campo_nombre unique (nombre)
);


--defaults

alter table division
add constraint df_categoria default ('1DIV') for categoria;

--CHECKS

alter table campo
add constraint chk_campo_capacidad check (capacidad >= 10);

--FOREING KEYS

alter table equipo
add
constraint FK_cod_division 
foreign key(cod_division)
references division (codigo)
on update cascade,

constraint FK_num_campo
foreign key(num_campo)
references campo (numero)
on update cascade;

alter table partido
add
constraint FK_id_equipo_local
foreign key (id_equipo_local)
references equipo (identificador)
on update no action,

constraint FK_id_equipo_visitante
foreign key (id_equipo_visitante)
references equipo (identificador)
on update no action;
