create database videoteca_bea;

go 
use videoteca_bea;
go

CREATE TABLE PRODUCTORA(
identificador tinyint not null,
nombre varchar(100) not null, --clave candidata

constraint pk_PRODUCTORA_identificador primary key(identificador),
constraint uq_PRODUCTORA_nombre unique(identificador)

);


create table PELICULA(
codigo int not null,
titulo varchar(150), -- clave candidata
fecha_estreno date null constraint ch_validar_fecha check(fecha_estreno<=getdate()),
id_productora tinyint null,

constraint pk_PELICULA_codigo primary key(codigo),
constraint uq_PELICULA_titulo unique(titulo),

constraint FK_ID_PRODUCTORA 
foreign key(id_productora)
references PRODUCTORA(identificador)

);

CREATE TABLE CAJA(

numero tinyint not null,
estanteria int not null,
balda tinyint not null constraint df_caja_balda default (0), -- default

constraint PK_CAJA_numero primary key(numero),

);


create table COPIA(
cod_pelicula int not null,
numero int not null,
formato char(1) not null constraint ch_COPIA_FORMATO check (formato IN ('D','V','S')),
num_caja tinyint not null, --foreing key de caja 

constraint pk_COPIA_cod_pelicula_numero primary key(cod_pelicula,numero),
constraint UQ_num_caja unique(num_caja), --CLAVE CANDIDATA 1-1

--foreign key de pelicula
constraint FK_COPIA_cod_pelicula 
foreign key (cod_pelicula)
references PELICULA(codigo),

--foreign key de caja
constraint FK_CAJA_num_caja 
foreign key (num_caja)
references CAJA(numero),

);

create table PERSONA(

codigo int not null,
tipo_doc char(5) not null, -- clave candidata
num_doc varchar(15), -- clave candidata
nombre varchar(30) not null,
ape1 varchar(30) not null,
ape2 varchar(30) null,
tipo char(3) not null, 

constraint PK_PERSONA_codigo primary key(codigo),
constraint UQ_PERSONA_docID unique (tipo_doc,num_doc),

--checks
constraint chk_PERSONA_tipo check (tipo in('EMP', 'SOC')),

);

create table EMPLEADO(
cod_emple int not null,

constraint PK_EMPLEADO_cod_emple primary key (cod_emple),

--la foranea de la jerarquía
constraint FK_EMPLEADO_Cod_emple
foreign key (cod_emple)
references persona (codigo)

);


create table MANDA(
cod_supervisa_a int not null,
cod_es_supervisado_por int not null,

constraint PK_MANDA_cod_supervisa_a primary key(cod_supervisa_a),
constraint UQ_MANDA_cod_es_supervisado_por unique (cod_es_supervisado_por),

--foraneas
constraint FK_MANDA_COD_SUPERVISA_A
foreign key(cod_supervisa_a)
references EMPLEADO(cod_emple),

constraint FK_MANDA_cod_es_supervisado_por
foreign key (cod_es_supervisado_por)
references EMPLEADO(cod_emple)

);

create table SOCIO(
cod_socio int not null,

constraint PK_SOCIO_cod_socio primary key (cod_socio),

--la foranea de la jerarquía
constraint FK_SOCIO_cod_socio
foreign key (cod_socio)
references persona (codigo)

);


create table ALQUILA(
cod_socio int not null,
cod_pelicula int not null, 
num_copia int not null,

--PRIMARY KEYS
constraint PK_ALQUILA_ primary key(cod_socio,cod_pelicula,num_copia),

--foreign keys

constraint FK_ALQUILA_cod_socio
foreign key (cod_socio)
references persona (codigo),


--hacemos solo una foreign key con los dos atributos.
constraint FK_ALQUILA_num_copia
foreign key (cod_pelicula, num_copia)
references COPIA (cod_pelicula,numero),

);












