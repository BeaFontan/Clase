/*******************************************************/
/***********EXAMEN 2ª EVALUACIÓN ***********************/
/**********CREACIÓN DE BASES DE DATOS*******************/

/***NOMBRE DEL ALUMNO/A:BORJA CALVO RODRÍGUEZ                                 */


--PARTE 1- CREAR UNA BASE DE DATOS
--1. Realiza el script de creación COMPLETO de la BD TRANSPORTES
/*RESPUESTA DEL ALUMNO/A*/
use  master;
go
--Creación da BD:
CREATE DATABASE TRANSPORTES;
GO

USE TRANSPORTES;

--Creación de las tablas
/************************************/
CREATE TABLE MEDIO_DE_TRANSPORTE(
	codigo int not null,
	nombre varchar(50) not null,
	tipo char(3) not null
);
ALTER TABLE MEDIO_DE_TRANSPORTE
ADD CONSTRAINT PK_MEDIO_TRANSPORTE_codigo PRIMARY KEY(codigo),
	CONSTRAINT UQ_MEDIO_TRANSPORTE_nombre UNIQUE(nombre),
	CONSTRAINT CHK_MEDIO_DE_TRANSPORTE_valores_tipo CHECK(tipo IN ('COL', 'PRI'));

CREATE TABLE MEDIO_COLECTIVO(
	cod_mtransp_colectivo int not null,
	precio numeric(5,2) not null,
	iva numeric(3,2) not null,
	importeBillete as (precio*(1+iva))
);
ALTER TABLE MEDIO_COLECTIVO
ADD CONSTRAINT PK_MEDIO_COLECTIVO_cod_mtransp_colectivo PRIMARY KEY(cod_mtransp_colectivo),
    CONSTRAINT CHK_MEDIO_COLECTIVO_precio_minimo CHECK(precio>=0),
	CONSTRAINT CHK_MEDIO_COLECTIVO_rango_iva CHECK(iva between 0 and 0.21),
	CONSTRAINT DF_MEDIO_COLECTIVO_iva DEFAULT 0.1 FOR iva;

CREATE TABLE MEDIO_PRIVADO(
	cod_mtransp_privado int not null
);
ALTER TABLE MEDIO_PRIVADO
ADD CONSTRAINT PK_MEDIO_PRIVADO_cod_mtransp_privado PRIMARY KEY(cod_mtransp_privado);


CREATE TABLE PERSONA(
	numero smallint not null,
	nombre varchar(30) not null,
	ape1 varchar(30) not null,
	ape2 varchar(30) null,
	telefono1 char(9) null,
	telefono2 char(9) null,
	telefono3 char(9) null,
	tipo_doc varchar(5) not null,
	num_doc varchar(15) not null,
	cod_mtransp_privado int null, 
	fecha_compra date null
);
ALTER TABLE PERSONA
ADD CONSTRAINT PK_PERSONA_numero PRIMARY KEY(numero),
    CONSTRAINT UQ_PERSONA_DocID UNIQUE(tipo_doc, num_doc),
	CONSTRAINT CHK_PERSONA_valores_tipo_doc CHECK(tipo_doc in('NIF', 'NIE', 'PASAP', 'DOCUE')),
	CONSTRAINT CHK_PERSONA_fecha_compra_maxima CHECK(fecha_compra<getdate());

CREATE TABLE conducido_por(
	cod_medio_transporte int not null,
	num_persona smallint not null
);
ALTER TABLE conducido_por
ADD CONSTRAINT PK_conducido_por_cod_medio_transporte_num_persona PRIMARY KEY(cod_medio_transporte, num_persona);

CREATE TABLE PARADA(
	numero tinyint not null,
	descripcion varchar(70) not null,
	cod_mtransp_colectivo int not null

);
ALTER TABLE PARADA
ADD CONSTRAINT PK_PARADA_numero_cod_mtransp_colectivo PRIMARY KEY(numero, cod_mtransp_colectivo);

CREATE TABLE realizada_en(
	num_parada tinyint not null,
	cod_mtransp_colectivo int not null,
	id_marquesina tinyint not null
);
ALTER TABLE realizada_en
ADD CONSTRAINT PK_realizada_en_num_parada_cod_mtransp_colectivo PRIMARY KEY(num_parada, cod_mtransp_colectivo),
	CONSTRAINT UQ_realizada_en_id_marquesina UNIQUE(id_marquesina);

CREATE TABLE MARQUESINA(
	identificador tinyint not null,
	nombreVia varchar(200) not null,
	numeroVia tinyint not null
);
ALTER TABLE MARQUESINA
ADD CONSTRAINT PK_MARQUESINA_identificador PRIMARY KEY(identificador),
    CONSTRAINT CHK_MARQUESINA_valores_numVia CHECK(numeroVia between 1 and 200);

/*CLAVES FORÁNEAS*/
ALTER TABLE MEDIO_COLECTIVO
ADD CONSTRAINT FK_MEDIO_COLECTIVO_MEDIO_DE_TRANSPORTE 
			   FOREIGN KEY(cod_mtransp_colectivo) 
			   REFERENCES MEDIO_DE_TRANSPORTE(codigo) 
			   ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE MEDIO_PRIVADO
ADD CONSTRAINT FK_MEDIO_PRIVADO_MEDIO_DE_TRANSPORTE 
				FOREIGN KEY(cod_mtransp_privado) 
				REFERENCES MEDIO_DE_TRANSPORTE(codigo)
				ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE conducido_por
ADD CONSTRAINT FK_conducido_por_MEDIO_DE_TRANSPORTE 
				FOREIGN KEY(cod_medio_transporte) 
				REFERENCES MEDIO_DE_TRANSPORTE(codigo)
				ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT FK_conducido_por_PERSONA 
				FOREIGN KEY (num_persona) 
				REFERENCES PERSONA(numero)
				ON DELETE NO ACTION ON UPDATE CASCADE;


ALTER TABLE PERSONA
ADD CONSTRAINT FK_PERSONA_MEDIO_PRIVADO
				FOREIGN KEY(cod_mtransp_privado) 
				REFERENCES MEDIO_PRIVADO(cod_mtransp_privado)
				ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE PARADA
ADD CONSTRAINT FK_PARADA_MEDIO_COLECTIVO
			   FOREIGN KEY(cod_mtransp_colectivo) 
			   REFERENCES MEDIO_COLECTIVO(cod_mtransp_colectivo) 
			   ON DELETE NO ACTION ON UPDATE NO ACTION;


ALTER TABLE realizada_en
ADD CONSTRAINT FK_realizada_en_PARADA
			   FOREIGN KEY(num_parada, cod_mtransp_colectivo) 
			   REFERENCES PARADA(numero, cod_mtransp_colectivo) 
			   ON DELETE NO ACTION ON UPDATE CASCADE,
	CONSTRAINT FK_realizada_en_MARQUESINA
			   FOREIGN KEY(id_marquesina) 
			   REFERENCES MARQUESINA(identificador) 
			   ON DELETE NO ACTION ON UPDATE CASCADE;