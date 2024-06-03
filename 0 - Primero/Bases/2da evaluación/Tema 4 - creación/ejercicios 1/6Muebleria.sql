create database MUEBLERIA_BEA;

GO
USE MUEBLERIA_BEA;
GO

create table EMPLEADO(
numero int not null constraint PK_EMPLEADO_num primary key(numero),
dni char(9) not null constraint UQ_EMPLEADO_dni unique(dni),
nombre varchar(30) not null,
ape1 varchar(30) not null,
ape2 varchar(30) not null,
salario numeric(6,2) not null constraint CH_EMPLEADO_salarioMaximo check(salario < 9999.99),
telefono1 int null,
telefono2 int null,
CCC_entidad char(4) not null,
CCC_oficina char(4) not null,
CCC_digitos_control char(2) not null,
CCC_num_cuenta char(10) not null,
cargo char(3) not null constraint CH_EMPLEADO_cargo check (cargo in ('PAP', 'MON', 'REP')),
dietas as (salario*0.10) -- campo calculado 

);

create table PERSONAL_AP(
num_personal_AP int not null constraint PK_PERSONAL_AP primary key(num_personal_AP),
objetivoVentas int not null constraint CH_OBJ_VENTAS check(objetivoVentas between 0 and 15000.999)
							constraint DF_OBJ_VENTAS default(0),
funcion char(3) not null,

--foranea de jerarquía
constraint FK_PERSOLAN_AP_num_persola
foreign key (num_personal_AP)
references EMPLEADO(numero)
on update cascade

);

create table VENDEDOR(
num_vendedor int not null constraint PK_VENDEDOR_num_vendedor primary key (num_vendedor),

--foranea de jerarquía
constraint FK_VENDEDOR
foreign key (num_vendedor)
references PERSONAL_AP(num_personal_AP)

);

create table VIGILA(
num_vendedor_vigila int not null,
num_vendedor_es_vigilado_por int not null,

constraint PK_VIGILA_num_vendedor_vigila primary key(num_vendedor_vigila),
constraint UQ_VIGILA_num_vendedor_es_vigilado_por unique (num_vendedor_es_vigilado_por),

--foraneas
constraint FK_VIGILA_num_vendedor_vigila
foreign key(num_vendedor_vigila)
references VENDEDOR(num_vendedor),

constraint FK_MANDA_cod_es_supervisado_por
foreign key (num_vendedor_es_vigilado_por)
references VENDEDOR(num_vendedor)

);


create table MONTADOR(
num_montador int not null constraint PK_MONTADOR_num_montador primary key(num_montador),

--foreign key de la jerarquía
constraint FK_MONTADOR_num_montador 
foreign key (num_montador)
references EMPLEADO(numero)
on update cascade

);

create table REPARTIDOR(
num_Repartidor int not null constraint PK_REPARTIDOR_num_repartidor primary key(num_repartidor),

--foreign key de la jerarquía
constraint FK_REPARTIDOR_num_repartidor
foreign key (num_Repartidor)
references EMPLEADO(numero)
on update cascade
);


create table MUEBLE(
identificador smallint not null constraint PK_MUEBLE_identificador primary key(identificador),
marca char(50) not null,
precio float not null constraint CH_MUEBLE_precio_max check(precio < 20000.55), 
fechaFabricacion date null constraint CH_MUEBLE_fecha_minima check(fechaFabricacion > '31/12/1999'),

num_montador int null, --foreign key

constraint FK_MUEBLE_num_montador
foreign key (num_montador)
references MONTADOR(num_montador)
on update cascade

);


create table ENTREGA(
num_repartidor_entrega int not null,
id_mueble smallint not null,
fecha_Hora_Entrega datetime not null,
fecha_Hora_Devolucion datetime null,


--clave primaria 
constraint PK_ENTREGA_num_repartidor_fecha_hora_entrega
primary key (num_repartidor_entrega, fecha_Hora_Entrega), 
-- hAY QUE PONER COMA OBLIGATORIAMENTE PARA PODER HACER EL CHECK DE FECHA HORA, SINO DA ERROR

constraint CH_ENTREGA_DEV_FECHA_MAYOR check (fecha_Hora_Devolucion > fecha_Hora_Entrega),

--claves foráneras

constraint FK_ENTREGA_num_repartidor
foreign key(num_repartidor_entrega)
references REPARTIDOR(num_repartidor),


constraint FK_ENTREGA_id_mueble
foreign key(id_mueble)
references MUEBLE(identificador)


);



