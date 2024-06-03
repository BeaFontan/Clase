create database TRANSPORTES_BEA;

GO
use TRANSPORTES_BEA;
GO

create table MEDIO_TRANSPORTE(
codigo int not null,
nombre varchar(50) not null, --clave candidata
tipo char(3) not null constraint CH_MEDIO_TIPO check (tipo in ('COL', 'PRI')),

constraint PK_MEDIO_TRANSPORTE_codigo primary key(codigo),
constraint UQ_MEDIO_TRANSPORTE_nombre unique(nombre)

);


CREATE TABLE MEDIO_COLECTIVO(
cod_MTrans_Colectivo int not null, -- primary key
precio numeric(5,2) not null,
iva numeric(3,2) not null 
						CONSTRAINT DF_importe_iva default(0.10)
						constraint CH_controlar_iva check(iva between 0 and 0.21),
importeBillete AS (PRECIO*IVA),

constraint PK_MEDIO_COLECTIVO_cod_MTrans_Colectivo primary key(cod_MTrans_Colectivo),

--clave for�nea
constraint FK_MEDIO_COLECTIVO_MEDIO_TRANSPORTE_cod_MTrans_Colectivo 
foreign key (cod_MTrans_Colectivo)
references MEDIO_TRANSPORTE(codigo)
on update cascade

);


CREATE TABLE MEDIO_PRIVADO(
cod_MTrans_Privado int not null,--clave primaria y for�nea

constraint PK_MEDIO_PRIVADO_cod_MTrans_Privado primary key (cod_MTrans_Privado),

--clave for�nea
constraint FK_MEDIO_PRIVADO_MEDIO_PRIVADO_cod_MTrans_Privado
foreign key (cod_MTrans_Privado)
references MEDIO_TRANSPORTE(codigo)
on update cascade

);


CREATE TABLE PERSONA(
numero smallint not null, --primary key
nombre varchar(30) not null,
ape1 varchar(30) not null,
ape2 varchar(30) not null,
docId_tipo varchar(5) not null constraint CH_PERSONA_TIPODOC check(docId_tipo in ('NIF', 'NIE', 'PASAP', 'DOCUE')), --candidata
docId_numDoc char(15) not null, --canditata
telefono1 varchar(13) null,
telefono2 varchar(13) null,
telefono3 varchar(13) null,
cod_medio_privado int null, -- clave for�nea
fechaCompra date null constraint CH_COMPROBAR_FECHA check(getdate() > fechaCompra),

constraint PK_PERSONA_numero primary key(numero),
constraint UQ_PERSONA_DocID unique(docId_tipo, docId_numDoc),

constraint FK_PERSONA_MEDIO_PRIVADO_cod_medio_privado
foreign key(cod_medio_privado)
references MEDIO_PRIVADO(cod_MTrans_Privado)
on update cascade

);

create table CONDUCIDO_POR(
num_Medio_Trans int not null, --clave for�nea
num_persona smallint not null, -- clave for�nea

constraint PK_CONDUCIDO_POR_num_Medio_Trans_num_persona primary key(num_Medio_Trans, num_persona),

--foranea 1
constraint Fk_CONDUCIDO_MEDIO_TRANSPORTE_MEDIO_TRANSPORTE_POR_num_Medio_Trans 
foreign key (num_Medio_Trans)
references MEDIO_TRANSPORTE(codigo)
on update cascade,

--foranea 2
constraint Fk_CONDUCIDO_PERSONA_POR_PERSONA_num_persona
foreign key(num_persona)
references PERSONA(numero)
on update cascade

);


CREATE TABLE PARADA(
cod_MTransp_Colectivo int not null, -- clave primaria y for�nea
numero tinyint not null, -- clave primaria
descripcion varchar(70) not null,


constraint PK_PARADA_cod_MTransp_Colectivo Primary key(cod_MTransp_Colectivo,numero),

--foranea
constraint FK_PARADA_MEDIO_COLECTIVO_cod_MTransp_Colectivo 
foreign key (cod_MTransp_Colectivo)
references MEDIO_COLECTIVO(cod_MTrans_Colectivo)


);

create table MARQUESINA(
identificador tinyint not null, --clave primaria
nombreVia varchar(200) not null,
numeroVia tinyint not null constraint CH_MAQUESINA_controlvia check(numeroVia > 0 and numeroVia < 200), 

constraint PK_MARQUESINA_identificador primary key(identificador)

);

create table REALIZADA_EN(
cod_MTransp_Colectivo int not null,
num_parada tinyint not null,
id_marquesina tinyint not null,

--clave primaria y unique por 0-1 0-1

constraint PK_REALIZADA_EN_cod_MTransp_Colectivo_num_parada primary key(cod_MTransp_Colectivo,num_parada),
constraint UQ_REALIZA_EN_id_maquesina unique (id_marquesina),


--clave foranea de para que es dependiente de medio colectivo
constraint FK_REALIZADA_EN_PARADA
foreign key(cod_MTransp_Colectivo,num_parada)
references PARADA(cod_MTransp_Colectivo,numero)
on update cascade

);






