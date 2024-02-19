create database eurovision_bea_2;

go 
use eurovision_bea_2;
go


create table interprete(
	numero int not null,
	nombre varchar(40) not null,
	fechaNac date null,
	num_cancion int not null, --clave foránea tabla cancion

	constraint pk_interprete_identificador primary key (numero),
	constraint uq_interprete_nombre unique (nombre));

create table cancion(
	numero int not null,
	titulo varchar(80) null,
	id_pais int not null, --clave foránea de pais

	constraint pk_cancion_numero primary key (numero),
	constraint uq_cancion_id_pais unique (id_pais)
);

create table pais(
	identificador int not null,
	denominacion varchar(70) not null,

	constraint pk_pais_identificador primary key (identificador),
	constraint uq_pais_denominacion unique (denominacion));

create table votacion(
	id_pais_vota_a int not null, -- clave foranea NM
	id_pais_es_votado_por int not null, -- clave foránea NM
	puntos int null,

	constraint pk_votacion primary key (id_pais_vota_a, id_pais_es_votado_por));

	--VALOR POR DEFECTO
	alter table votacion
	add constraint df_votacion default (0) for puntos;

	--CHECKS

	alter table interprete
	add constraint chk_control_fecha_nac check (datediff(year,getdate(),fechaNac) >= 16);


	--CLAVES FORANEAS

	--clave foránea de cancion pasa para intérprete N:1
	alter table interprete
	add
	constraint fk_interprete_cancion_num_numero
	foreign key(num_cancion)
	references cancion (numero)
	on update cascade;

	--primary key de pais pasa a cancion a país

	alter table cancion
	add
	constraint FK_CANCION_PAIS_id_pais
	foreign key(id_pais)
	references pais (identificador)
	on update cascade;

	--primary key de votacion
	alter table votacion
	add
	constraint FK_PAIS_pais_vota_a
	foreign key(id_pais_vota_a)
	references pais (identificador)
	on update no action --no me deja hacerlo si pongo cascade
	on delete no action,

	constraint FK_PAIS_pais_es_votado_por
	foreign key(id_pais_es_votado_por)
	references pais (identificador)
	on update no action --no me deja hacerlo si pongo cascade
	on delete no action;






