drop DATABASE ACADEMIA_BEA;

GO
USE ACADEMIA_BEA;
GO

CREATE TABLE EMPLEADO(

	codigo tinyint not null,
	tipo_doc char(5) not null,
	num_doc varchar(15) not null,
	telefono1 char(9) null,
	telefono2 char(9) null,
	telefono3 char(9) null,
	fecha_contrato date not null,

	constraint pk_EMPLEADO_codigo primary key (codigo),

	--CHECKS

	constraint CH_EMPLEADO_num_doc check (tipo_doc in ('NIF', 'NIE', 'PASAP', 'DOCUE')),
	constraint CH_EMPLEADO_comprobar_fecha_contrato check (fecha_contrato > '01/03/2000' and fecha_contrato <= getdate()),
	
	--DEFAULTS
	constraint DF_EMPRELADO_fecha_contrato default (getdate()) for fecha_contrato
);


create table CURSO(
	codigo tinyint not null,
	titulo varchar(80) not null,
	num_horas tinyint not null,

	constraint pk_CURSO_codigo primary key (codigo),
	constraint UQ_CURSO_titulo unique (titulo)

);


create table EDICION(

	numero int not null,
	fecha_hora_inicio datetime not null,
	cod_empleado tinyint null, --FOREING KEY 
	cod_curso tinyint not null --FOREING KEY 

	constraint PK_EDICION_numero primary key (numero)

	--FOREING KEYS
	constraint FK_EDIFICION_cod_empreado 
	foreign key(cod_empleado)
	references empleado (codigo)
	on update cascade,

	constraint FK_EDICION_cod_curso
	foreign key(cod_curso)
	references curso(codigo)
	on update no action

);

create table PRERREQUISITO(

	cod_prerrequisito_de tinyint not null, --foranea
	cod_tiene_por_prerrequisito tinyint not null, --foranea
	tipo char(1) null,

	constraint PK_PRERREQUISITO_cod_prerrequisito_de primary key(cod_prerrequisito_de),
	constraint UQ_PRERREQUISITO_cod_tiene_prerrequisito unique (cod_tiene_por_prerrequisito),

	--CHECK

	constraint chk_PRERR_tipo check (tipo = 'R' OR tipo = 'O'),

	--foreing key

	constraint FK_PRERREQUISITO_cod_prerrequisito_d 
	foreign key (cod_prerrequisito_de)
	references curso (codigo)
	on update no action,

	constraint FK_PRERREQUISITO_cod_tiene_por_prerrequisito
	foreign key (cod_tiene_por_prerrequisito)
	references curso (codigo)
	on update no action

);






