/***********************************************************************/
/******************* TAREA 1: Crear BD EUROVISION **********************/
/***********************************************************************/
--creación da base de datos eurovision
use master;
go
create database EUROVISION;
GO
use eurovision;
GO

create table interprete
(numero int not null,
 nombre varchar(40) not null,
 fecha_nac date null,
 num_cancion int not null
);
alter table interprete add
constraint pk_interprete_numero primary key(numero),
constraint uk_interprete_nombre unique(nombre),
constraint chk_interprete_edadnomenos16 
    check (datediff(year,fecha_nac,getdate())>=16);

create table cancion
(numero int not null,
 titulo varchar(80) not null,
 id_pais int not null);
alter table cancion add
constraint pk_cancion_numero primary key(numero),
constraint uq_cancion_id_pais unique(id_pais);--Porque la relación es 1:1

create table pais
(
 identificador int not null,
 denominacion varchar(70) not null
);
alter table pais add
constraint pk_pais_identificador primary key(identificador),
constraint uk_pais_denominacion unique(denominacion);

create table votacion
(
 id_pais_votante int not null,
 id_pais_votado int not null,
 puntos int not null
);

alter table votacion add
constraint pk_votacion primary key(id_pais_votante,id_pais_votado),
constraint df_votacion_puntos default 0 for puntos;
    
--Claves foráneas
alter table interprete 
add constraint FK_interprete_cancion
foreign key(num_cancion)
references cancion(numero)
on update cascade;

alter table cancion
add constraint FK_cancion_pais
foreign key(id_pais)
references pais(identificador)
on update cascade;

alter table votacion
add constraint FK_votacion_pais_votante
foreign key(id_pais_votante)
references pais(identificador),
constraint FK_votacion_pais_votado
foreign key(id_pais_votado)
references pais(identificador);
/********************** FIN TAREA 1 ************************************/


/***********************************************************************/
/******************* TAREA 2: Crear BD LIGA ****************************/
/***********************************************************************/
use master;
go
CREATE DATABASE LIGA
GO

USE LIGA;
GO
--Creación de la tabla EQUIPO

CREATE TABLE EQUIPO
(
	identificador int not null,
	cif char(9) not null, 
	nombre varchar(30) not null, 
	presupuesto decimal(14,2) not null,
	num_campo int not null,
	cod_division int not null
);
ALTER TABLE EQUIPO ADD 
CONSTRAINT PK_EQUIPO_identificador PRIMARY KEY(identificador),
CONSTRAINT UQ_EQUIPO_cif UNIQUE(cif),
CONSTRAINT UQ_EQUIPO_nombre UNIQUE(nombre),
CONSTRAINT UQ_EQUIPO_num_campo UNIQUE(num_campo);--PARA ESTABLECER LA RELACIÓN 1:1
                                                 --TB se podría haber llevado el ID_EQUIPO
                                                 --A CAMPO


--Creación de la tabla PARTIDO
CREATE TABLE PARTIDO
(id_equipo_local int not null,
 id_equipo_visitante int not null, 
 fechahora smalldatetime not null,
 observaciones varchar(150) null
);
ALTER TABLE PARTIDO ADD
CONSTRAINT PK_PARTIDO PRIMARY KEY(id_equipo_local, fechahora);

--Creación de la tabla DIVISIÓN
CREATE TABLE DIVISION
(codigo int not null,
 nombre varchar(70) not null,
 categoria char(4) null
);
ALTER TABLE DIVISION ADD 
CONSTRAINT PK_DIVISION_codigo PRIMARY KEY(codigo),
CONSTRAINT UQ_DIVISION_nombre UNIQUE(nombre),
CONSTRAINT DF_DIVISION_categoria DEFAULT '1DIV' FOR categoria;

--Creación de la tabla CAMPO
CREATE TABLE CAMPO
(numero int not null,
 nombre varchar(100) not null,
 capacidad int not null
);
ALTER TABLE CAMPO ADD
CONSTRAINT PK_CAMPO_numero PRIMARY KEY(numero),
CONSTRAINT UQ_CAMPO_nombre UNIQUE(nombre),
CONSTRAINT CHK_capacidadminimo500 CHECK(capacidad>=500);

/*CLAVES FORÁNEAS*/
ALTER TABLE EQUIPO ADD
CONSTRAINT FK_EQUIPO_CAMPO_num_campo 
	FOREIGN KEY(num_campo)
	REFERENCES CAMPO(numero)
	ON UPDATE CASCADE,
CONSTRAINT FK_EQUIPO_DIVISION_cod_division
	FOREIGN KEY(cod_division)
	REFERENCES DIVISION(codigo)
	ON UPDATE CASCADE;
--El borrado no se indica porque la opción NO ACTION 
--es la que el servidor escoge por defecto si no se 
--indica ninguna
ALTER TABLE PARTIDO ADD
CONSTRAINT PARTIDO_EQUIPO_id_equipo_local
	FOREIGN KEY(id_equipo_local)
	REFERENCES EQUIPO(identificador),
CONSTRAINT PARTIDO_EQUIPO_id_equipo_visitante
	FOREIGN KEY(id_equipo_visitante)
	REFERENCES EQUIPO(identificador);
--Los borrados y modificaciones no se indican 
--porque la opción NO ACTION 
--es la que el servidor escoge por defecto si no se 
--indica ninguna
/********************** FIN TAREA 2 ************************************/




/***********************************************************************/
/***************** TAREA 3: Crear BD ACADEMIA_EXAMEN *******************/
/***********************************************************************/
use master;
go
CREATE DATABASE ACADEMIA_EXAMEN;
GO
USE ACADEMIA_EXAMEN;
GO

CREATE TABLE CURSO
(
	codigo tinyint not null,
	titulo varchar(80) not null,
	num_horas tinyint not null,
);
ALTER TABLE CURSO
ADD 
	CONSTRAINT PK_CURSO_codigo PRIMARY KEY(codigo),
	CONSTRAINT UQ_CURSO_titulo UNIQUE(titulo);

CREATE TABLE PRERREQUISITO
(
	cod_curso tinyint not null,
	cod_curso_prerrequisito tinyint not null,
	tipo char(1) null
);
ALTER TABLE PRERREQUISITO
ADD
	CONSTRAINT PK_PRERREQUISITO_cod_curso PRIMARY KEY(cod_curso),--IMPORTANTE
	CONSTRAINT UQ_PRERREQUISITO_cod_curso_prerrequisito UNIQUE(cod_curso_prerrequisito),--IMPORTANTE
	CONSTRAINT CHK_PRERREQUISITO_valores_tipo CHECK(tipo in ('R','O'));
	
CREATE TABLE EDICION
(
	numero smallint not null,
	fecha_hora_inicio datetime not null,
	cod_curso tinyint not null,
	cod_empleado tinyint null --IMPORTANTE
);
ALTER TABLE EDICION
ADD 
	CONSTRAINT PK_EDICION_numero PRIMARY KEY(numero);--IMPORTANTE


CREATE TABLE EMPLEADO
(
    codigo tinyint not null,
	tipo_doc varchar(5) not null, --VARCHAR PORQUE TENEMOS NIF pero TB DOCUE
	num_doc varchar(15) not null,
	telefono1 char(9) null,
	telefono2 char(9) null,
	telefono3 char(9) null,
	fecha_contrato date not null
);
ALTER TABLE EMPLEADO
ADD 
	CONSTRAINT PK_EMPLEADO_codigo PRIMARY KEY(codigo),
	CONSTRAINT CHK_EMPLEADO_control_fechacontrato 
		CHECK(fecha_contrato between '1-3-2000' and getdate()),--IMPORTANTE
	CONSTRAINT DF_EMPLEADO_fecha_contrato DEFAULT getdate() FOR fecha_contrato,--IMPORTANTE
	CONSTRAINT CHK_EMPLEADO_tipo_doc CHECK (tipo_doc in('NIF','NIE','PASAP','DOCUE'));


--CLAVES FORÁNEAS
ALTER TABLE PRERREQUISITO
ADD 
	CONSTRAINT FK_PRERREQUISITO_CURSO_cod_curso FOREIGN KEY (cod_curso)
	REFERENCES CURSO(codigo)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION,
	CONSTRAINT FK_PRERREQUISITO_CURSO_cod_curso_prerrequisito FOREIGN KEY (cod_curso_prerrequisito)
	REFERENCES CURSO(codigo)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION;
	
ALTER TABLE EDICION
ADD
	CONSTRAINT FK_EDICION_CURSO_cod_curso FOREIGN KEY (cod_curso)
	REFERENCES CURSO(codigo)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION,
	CONSTRAINT FK_EDICION_EMPLEADO_cod_empleado FOREIGN KEY (cod_empleado)
	REFERENCES EMPLEADO(codigo)
	ON DELETE NO ACTION
	ON UPDATE CASCADE;--IMPORTANTE
	
/********************** FIN TAREA 3 ************************************/


/***********************************************************************/
/******************** TAREA 4: Crear BD VIDEOTECA **********************/
/***********************************************************************/
use master;
go
CREATE DATABASE VIDEOTECA;
GO
USE VIDEOTECA;
GO
--Creación de las tablas
--Tabla PRODUCTORA
CREATE TABLE PRODUCTORA
(identificador smallint not null,
 nombre varchar(100) not null
);
ALTER TABLE PRODUCTORA
ADD CONSTRAINT PK_PRODUCTORA_identificador PRIMARY KEY(identificador),
	CONSTRAINT UQ_PRODUCTORA_nombre UNIQUE(nombre);

--Tabla PELICULA
CREATE TABLE PELICULA
(codigo int not null,
 titulo varchar(150) not null,
 fecha_estreno date null,
 id_productora smallint null --IMPORTANTE
);
ALTER TABLE PELICULA
ADD CONSTRAINT PK_PELICULA_codigo PRIMARY KEY(codigo),
	CONSTRAINT UQ_PELICULA_titulo UNIQUE(titulo),
	CONSTRAINT CHK_PELICULA_fecha_estreno CHECK(fecha_estreno<=getdate());


--Tabla COPIA
CREATE TABLE COPIA
(numero int not null,
 cod_pelicula int not null,
 formato char(1) not null,
 num_caja tinyint not null
);
ALTER TABLE COPIA
ADD CONSTRAINT PK_COPIA_numero_cod_pelicula PRIMARY KEY(numero,cod_pelicula),
	CONSTRAINT CHK_COPIA_valores_formato CHECK( formato in('D','V','S')),
	CONSTRAINT UQ_COPIA_num_caja UNIQUE(num_caja);


--Tabla CAJA
CREATE TABLE CAJA
(
	numero tinyint not null,
	estanteria int not null,
	balda tinyint not null
);
ALTER TABLE CAJA
ADD CONSTRAINT PK_CAJA_numero PRIMARY KEY(numero),
	CONSTRAINT DF_CAJA_balda DEFAULT 0 FOR balda;

--Tabla PERSONA
CREATE TABLE PERSONA
(codigo int not null,
 tipo_doc char(5) not null, 
 num_doc varchar(15) not null,
 tipo char(3) not null,
 nombre varchar(30) not null,
 ape1 varchar(30) not null,
 ape2 varchar(30) null
);
ALTER TABLE PERSONA
ADD CONSTRAINT PK_PERSONA_codigo PRIMARY KEY(codigo),
	CONSTRAINT UQ_PERSONA_DocId UNIQUE(tipo_doc,num_doc),
	CONSTRAINT CHK_PERSONA_valores_tipo CHECK(tipo in('EMP','SOC'));

--Tabla EMPLEADO
CREATE TABLE EMPLEADO
(cod_emple int not null);

ALTER TABLE EMPLEADO
ADD CONSTRAINT PK_EMPLEADO_cod_emple PRIMARY KEY(cod_emple);

--Tabla MANDA_EN
CREATE TABLE MANDA_EN
(	cod_emple int not null,
    cod_emple_supervisor int not null
);
ALTER TABLE MANDA_EN
ADD CONSTRAINT PK_MANDA_EN_cod_emple PRIMARY KEY(cod_emple),
    CONSTRAINT UQ_MANDA_EN_cod_emple_supervisor UNIQUE(cod_emple_supervisor);

--Tabla SOCIO
CREATE TABLE SOCIO
(cod_socio int not null);

ALTER TABLE SOCIO
ADD CONSTRAINT PK_SOCIO_cod_socio PRIMARY KEY(cod_socio);

--Tabla ALQUILA
CREATE TABLE ALQUILA
(cod_socio_alquila int not null,
 num_copia int not null,
 cod_pelicula int not null
);

ALTER TABLE ALQUILA
ADD CONSTRAINT PK_ALQUILA_cod_socio_alquila_num_copia_cod_pelicula PRIMARY KEY(cod_socio_alquila,num_copia,cod_pelicula);

/*CLAVES FORÁNEAS*/
ALTER TABLE PELICULA
ADD CONSTRAINT FK_PELICULA_PRODUCTORA FOREIGN KEY (id_productora)
               REFERENCES PRODUCTORA(identificador)
			   ON DELETE NO ACTION
			   ON UPDATE CASCADE;

ALTER TABLE COPIA
ADD CONSTRAINT FK_COPIA_PELICULA_cod_pelicula FOREIGN KEY(cod_pelicula) 
			   REFERENCES PELICULA(codigo)
			   ON DELETE NO ACTION
			   ON UPDATE CASCADE,
	CONSTRAINT FK_COPIA_CAJA_num_caja FOREIGN KEY(num_caja) 
			   REFERENCES CAJA(numero)
			   ON DELETE NO ACTION
			   ON UPDATE CASCADE;

ALTER TABLE ALQUILA
ADD CONSTRAINT FK_ALQUILA_SOCIO_cod_socio_alquila FOREIGN KEY (cod_socio_alquila)
			   REFERENCES SOCIO(cod_socio)
			   ON DELETE NO ACTION
			   ON UPDATE CASCADE,
	CONSTRAINT FK_ALQUILA_COPIA_num_copia_cod_pelicula FOREIGN KEY (num_copia, cod_pelicula)
			   REFERENCES COPIA(numero, cod_pelicula)
			   ON DELETE NO ACTION
			   ON UPDATE CASCADE;

ALTER TABLE EMPLEADO
ADD CONSTRAINT FK_EMPLEADO_PERSONA_cod_emple FOREIGN KEY(cod_emple) 
			   REFERENCES PERSONA(codigo)
			   ON UPDATE CASCADE
			   ON DELETE NO ACTION;


ALTER TABLE SOCIO
ADD CONSTRAINT FK_SOCIO_PERSONA_cod_socio FOREIGN KEY(cod_socio) 
			   REFERENCES PERSONA(codigo)
			   ON UPDATE CASCADE
			   ON DELETE NO ACTION;

			   
ALTER TABLE MANDA_EN
ADD CONSTRAINT FK_MANDA_EN_EMPLEADO_cod_emple FOREIGN KEY(cod_emple) 
			   REFERENCES EMPLEADO(cod_emple)
			   ON UPDATE CASCADE
			   ON DELETE NO ACTION,
	CONSTRAINT FK_MANDA_EN_EMPLEADO_cod_emple_supervisor FOREIGN KEY(cod_emple_supervisor) 
			   REFERENCES EMPLEADO(cod_emple)
			   ON UPDATE NO ACTION
			   ON DELETE NO ACTION;

/********************** FIN TAREA 4 ************************************/


/***********************************************************************/
/******************** TAREA 5: Crear BD MUEBLERÍA **********************/
/***********************************************************************/
use master;
go
CREATE DATABASE MUEBLERIA;
GO
USE MUEBLERIA;
GO

create table EMPLEADO
(
	numero int not null,
	nombre varchar (30) not null,
	ape1 varchar (30) not null,
	ape2 varchar (30) null,
	NIF char(9) not null,
	ccc_entidad char (4) not null,
	ccc_oficina char(4) not null,
	ccc_DC char (2) not null,
	ccc_numCuenta char(10) not null,
	telefono1 char(9) null,
	telefono2 char(9) null,
	cargo char(3) not null,
	salario decimal(6,2) not null,
	dietas as (salario * 0.1)
);
alter table EMPLEADO
add constraint PK_empleado_codigo primary key (numero),
	constraint UQ_empleado_nif unique (NIF),
	constraint CHK_empleado_cargo check (cargo in ('PAP', 'MON', 'REP'));

create table PERSONAL_AP
(
	num_PersonalAP int not null,
	objetivoVentas decimal (8,3) not null,
	funcion char(3) not null
);
alter table PERSONAL_AP
add constraint PK_personal_ap_num_PersonalAP primary key (num_personalAP),
	constraint DF_personal_ap_objetivoVentas default 0 for objetivoVentas,
	constraint CHK_personal_ap_objetivoVentas_rango check(objetivoVentas between 0 and 15000.999);

create table VENDEDOR 
(
	num_vendedor int not null
);
alter table VENDEDOR
add constraint PK_vendedor_num_vendedor primary key (num_vendedor);

create table VIGILA
(
	num_vendedor int not null,
	num_vigilante int not null
);
alter table VIGILA
add constraint PK_vigila_vendedor_num_vendedor primary key (num_vendedor),
	constraint UQ_vigila_num_vigilante unique (num_vigilante)

create table MONTADOR
(
	num_montador int not null
);
alter table MONTADOR
add constraint PK_montador_num_montador primary key (num_montador);

create table REPARTIDOR
(
	num_repartidor int not null
);
alter table REPARTIDOR
add constraint PK_repartidor_num_repartidor primary key (num_repartidor);

create table ENTREGA 
(
	num_repartidor int not null,
	fechaHoraEntrega Datetime not null,
	fechaHoraDevolucion datetime null,
	id_mueble smallint not null
);
alter table ENTREGA
add constraint PK_entrega_num_repartidor_fechahoraentrega_id_mueble primary key (num_repartidor, fechaHoraEntrega, id_mueble),
    constraint CHK_entrega_fechahoraentrega CHECK(fechaHoraEntrega>getdate()),
	constraint CHK_entrega_controlfechas CHECK(fechaHoraDevolucion>fechaHoraEntrega);
	/********************************************/
	--IMPORTANTE: estos 2 checks podrían hacerse en un único check del siguiente modo
	--constraint CHK_entrega_controlfechas CHECK(fechaHoraDevolucion>fechaHoraEntrega and fechaHoraEntrega>getdate());
	/********************************************/

create table MUEBLE
(
	identificador smallint not null,
	marca varchar(50) not null,
	precio decimal(7,2) not null,
	fechaFabricacion date null,
	num_montador int null
);
alter table MUEBLE
add constraint PK_mueble_identificador primary key (identificador),
    constraint CHK_mueble_precio_maximo check (precio between 0 and 20000.55),
	--IMPORTANTE: En el check anterior ponemos un 0 como mínimo para poder tener muebles que
	-- se obsequien con la compra de otros.
	constraint CHK_mueble_fechaFabricacion check (fechaFabricacion >= '01/01/2000');

/*CLAVES FORÁNEAS*/
alter table PERSONAL_AP
add constraint FK_personal_ap_empleado_num_personalAP foreign key (num_PersonalAP) references EMPLEADO(numero)
on delete no action
on update cascade;

alter table MONTADOR 
add constraint FK_montador_empleado_num_montador foreign key (num_montador) references EMPLEADO(numero)
on delete no action
on update cascade;

alter table REPARTIDOR
add constraint FK_repartidor_empleado_num_repartidor foreign key (num_repartidor) references EMPLEADO (numero)
on delete no action
on update cascade;

alter table VENDEDOR 
add constraint FK_vendedor_personal_ap_num_vendedor foreign key (num_vendedor) references PERSONAL_AP (num_PersonalAP)
on delete no action
on update no action;

alter table VIGILA
add constraint FK_vigila_vendedor_num_vendedor foreign key (num_vendedor) references VENDEDOR(num_vendedor)
on delete no action
on update no action,
	constraint FK_vigila_vendedor_num_vigilante foreign key (num_vigilante) references VENDEDOR(num_vendedor)
on delete no action
on update no action;

alter table ENTREGA
add constraint FK_entrega_repartidor_num_repartidor foreign key (num_repartidor) references REPARTIDOR(num_repartidor)
on delete no action
on update cascade,
	constraint FK_entrega_mueble_id_mueble foreign key (id_mueble) references MUEBLE(identificador)
on delete no action 
on update cascade;

alter table MUEBLE
add constraint FK_mueble_montador_num_montador foreign key (num_montador) references MONTADOR(num_montador)
on delete no action
on update no action;
/********************** FIN TAREA 5 ************************************/


/***********************************************************************/
/*TAREA 6: El objetivo de esta tarea es conseguir familiarizarse 
con la sintaxis SQL para las sentencias DDL. 
Se recomienda consultar la sintaxis y los ejemplos de las sentencias 
DDL detallados en la teoría.*/
/***********************************************************************/
--6.1. Crea un directorio en el disco duro de nombre Data_SQLServer.

--6.2. Crea una base de datos que tenga las siguientes características:
--nombre: CINE
--archivo de datos principal: su nombre lógico es cine y el físico cine_data, 
--que estará guardado en el directorio creado en el apartado 1.1. 
--El fichero deberá tener la extensión que le corresponde según su tipo. 
--El tamaño del fichero será de  5MB, con tamaño máximo de 200MB y 
--tasa de crecimiento de 1MB.
--archivo de registro: sus nombres lógico y físico es cine_log, 
--que estará guardado en el mismo directorio que el fichero de datos primario. 
--El archivo deberá tener la extensión que le corresponde según su tipo. 
--El tamaño del fichero será de  1MB con tasa de crecimiento del 5%.
--intercalación: el mapa de caracteres que usará la bd es Latin1_General_100_CI_AS
CREATE DATABASE CINE
ON PRIMARY (
	NAME= cine,
	FILENAME= 'C:\Data_SQLServer\cine_data.mdf',
	SIZE=5MB,--8MB en 2016
	MAXSIZE=200MB,
	FILEGROWTH=1MB)
LOG ON(
	NAME= cine_log,
	FILENAME= 'C:\Data_SQLServer\cine_log.ldf',
	SIZE= 1MB,
	FILEGROWTH=5%)
COLLATE Modern_Spanish_CI_AS;
GO

--6.3. Modifica el nombre de la bd CINE por el nombre PELICULAS.
ALTER DATABASE CINE
MODIFY NAME= PELICULAS;
GO

--6.4. Añade a la base de datos PELICULAS un archivo de datos secundario de 
--nombre lógico peliculas2, nombre físico peliculas_data2 (con la extensión correspondiente)
-- y guardado en el directorio creado en el apartado 1.1. El tamaño del fichero será de 2MB. 
ALTER DATABASE PELICULAS
ADD FILE (
	NAME= peliculas2,
	FILENAME= 'C:\Data_SQLServer\peliculas_data2.ndf',
	SIZE=2MB);
GO

--6.5. Elimina el fichero de datos peliculas2 (usando SQL).
ALTER DATABASE PELICULAS
REMOVE FILE peliculas2;
GO

--6.6. Modifica el estado de la bd PROBAS de tal manera que 
--quede inaccesible.
ALTER DATABASE PELICULAS
SET OFFLINE;
GO

--6.7. Modifica de nuevo el estado de la bd PROBAS para 
--que sea visible de nuevo.
ALTER DATABASE PELICULAS
SET ONLINE;
GO

--6.8. Modifica el nombre de la bd PELICULAS para que 
--vuelva a tener el original CINE.
ALTER DATABASE PELICULAS
MODIFY NAME= CINE;
GO

--6.9. Crear tablas y relaciones entre ellas.
USE CINE;

CREATE TABLE FESTIVAL(
identificador smallint NOT NULL,
nombre varchar(100) NOT NULL
);
ALTER TABLE FESTIVAL
ADD 
CONSTRAINT PK_FESTIVAL_identificador PRIMARY KEY(identificador),
CONSTRAINT UQ_FESTIVAL_nombre UNIQUE(nombre);

CREATE TABLE EDICION(
numeroEd smallint NOT NULL,
id_festival smallint NOT NULL,
fecha datetime NOT NULL,
lugar varchar(150) NOT NULL
);
ALTER TABLE EDICION
ADD
CONSTRAINT PK_EDICION_numEd_idFest PRIMARY KEY(numeroEd, id_festival);

CREATE TABLE PERSONA(
codigo smallint NOT NULL,
nombre varchar(30) NOT NULL,
ape1 varchar(30) NOT NULL,
ape2 varchar(30) NULL,
fechaNac datetime NULL
);
ALTER TABLE PERSONA
ADD
CONSTRAINT PK_PERSONA_codigo PRIMARY KEY(codigo);

CREATE TABLE ES_TRIBUNAL_DE(
cod_persona smallint NOT NULL,
num_edicion smallint NOT NULL,
id_festival smallint NOT NULL
);
ALTER TABLE ES_TRIBUNAL_DE
ADD
CONSTRAINT PK_ES_TRIBUNAL_DE PRIMARY KEY(cod_persona,num_edicion, id_festival);

CREATE TABLE NOMINACION(
identificadorNomin smallint NOT NULL,
observaciones varchar(200) NULL,
cod_persona smallint NOT NULL,
id_pelicula smallint NOT NULL,
cod_premio smallint NULL, --admite nulos por ser la cardinalidad (0,1)
);
ALTER TABLE NOMINACION
ADD
CONSTRAINT PK_NOMINACION_idNomin PRIMARY KEY(identificadorNomin);

CREATE TABLE PELICULA(
identificador smallint NOT NULL,
tituloOriginal varchar(100) NOT NULL,
tituloEspanol varchar(100) NOT NULL,
Resumen varchar(250) NOT NULL,
);
ALTER TABLE PELICULA
ADD
CONSTRAINT PK_PELICULA_identificador PRIMARY KEY(identificador);

CREATE TABLE PREMIO(
codigo smallint NOT NULL,
descripcion varchar(150) NOT NULL,
);
ALTER TABLE PREMIO
ADD
CONSTRAINT PK_PREMIO_codigo PRIMARY KEY(codigo),
CONSTRAINT UQ_PREMIO_descripcion UNIQUE(descripcion);--No tiene sentido que existan 
--dos premios con la misma descripción. La descripción sería clave candidata
--y por lo tanto hay que establecer una restricción de unicidad.

--CLAVES FORÁNEAS
ALTER TABLE  EDICION
ADD CONSTRAINT FK_EDICION_FESTIVAL
FOREIGN KEY (id_festival)
REFERENCES FESTIVAL(identificador);

ALTER TABLE  ES_TRIBUNAL_DE
ADD 
CONSTRAINT FK_ES_TRIBUNAL_DE_EDICION
FOREIGN KEY (num_edicion, id_festival)
REFERENCES EDICION(numeroEd,id_festival)
ON UPDATE CASCADE,
--ON DELETE NO ACTION, no hace falta porque es la opción por defecto
CONSTRAINT FK_ES_TRIBUNAL_DE_PERSONA
FOREIGN KEY (cod_persona)
REFERENCES PERSONA(codigo)
ON UPDATE CASCADE;
--ON DELETE NO ACTION, no hace falta porque es la opción por defecto


ALTER TABLE NOMINACION
ADD
CONSTRAINT FK_NOMINACION_PERSONA
FOREIGN KEY (cod_persona)
REFERENCES PERSONA(codigo)
ON UPDATE CASCADE,
--ON DELETE NO ACTION, no hace falta porque es la opción por defecto
CONSTRAINT FK_NOMINACION_PELICULA
FOREIGN KEY (id_pelicula)
REFERENCES PELICULA(identificador)
ON UPDATE CASCADE,
--ON DELETE NO ACTION, no hace falta porque es la opción por defecto
CONSTRAINT FK_NOMINACION_PREMIO
FOREIGN KEY (cod_premio)
REFERENCES PREMIO(codigo)
ON UPDATE CASCADE;
--ON DELETE NO ACTION, no hace falta porque es la opción por defecto


--6.10. En la tabla PREMIO añade un campo de nombre 
--cant_economica 
--en el que se deberá poder  guardar la cantidad en euros 
--del premio, 
--si es que el premio tiene cuantía económica.
--El premio máximo es de 12000 euros.
ALTER TABLE PREMIO
ADD cant_economica decimal(7,2) NULL 
    CONSTRAINT CHK_maximo12000 CHECK(cant_economica<=12000);

--6.11. Elimina el campo que acabas de crear y comprueba que ya no está en la tabla.
--Para poder borrar un campo que tiene restricciones
--primero hay que eliminar esas restricciones
ALTER TABLE PREMIO
DROP CONSTRAINT CHK_maximo12000;

ALTER TABLE PREMIO
DROP COLUMN cant_economica;

--6.12. Por último, elimina la base de datos CINE de la 
--instancia del servidor en la que se encuentra.

--Para poder eliminar la BD CINE, ésta no puede estar en uso,
--por lo que es necesario rechazar las conexiones.
USE master;

ALTER DATABASE CINE
SET SINGLE_USER;
GO
--si se actualiza el explorador de objetos
--se comprueba como aparece la bd CINE como de Usuario único
--Ahora borramos la bd
DROP DATABASE CINE;
GO
/********************** FIN TAREA 6 ************************************/

