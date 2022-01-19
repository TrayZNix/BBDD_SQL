DROP TABLE IF EXISTS companieros;
DROP TABLE IF EXISTS profesores;
DROP TABLE IF EXISTS caracteristicas;
DROP TABLE IF EXISTS rasgosfisicos;
DROP TABLE IF EXISTS rasgospersonalidad;

CREATE TABLE companieros (
	nombre			varchar[100],
	apellidos 		varchar[100],
	dni				varchar[9],
	numeroAsiento	serial,
	CONSTRAINT pk_dni_companieros PRIMARY KEY (dni)
);

CREATE TABLE profesores (
	nombre			varchar[100],
	apellidos 		varchar[100],
	dni				varchar[9],
	asignaturas		varchar[30],
	CONSTRAINT pk_dni_profesor PRIMARY KEY (dni)	
);

CREATE TABLE caracteristicas (
	dni				varchar[9],
	rasgo_dominante_p		smallint,
	rasgo_secundario_p		smallint,
	rasgo_dominante_f	 	smallint,
	rasgo_secundario_f	 	smallint,
	CONSTRAINT pk_dni_caracteristicas PRIMARY KEY (dni)
);

CREATE TABLE rasgosFisicos (
	id_rasgo serial,
	rasgo	varchar[30],
	CONSTRAINT pk_id_rasgo_fisico PRIMARY KEY (id_rasgo)
);

CREATE TABLE rasgosPersonalidad (
	id_rasgo serial,
	rasgo	varchar[30],
	CONSTRAINT pk_id_rasgo_personalidad PRIMARY KEY (id_rasgo)
);

ALTER TABLE caracteristicas 
ADD	CONSTRAINT fk_rasgoDomP FOREIGN KEY (rasgo_dominante_p) REFERENCES rasgosPersonalidad(id_rasgo),
ADD	CONSTRAINT fk_rasgoSecP FOREIGN KEY (rasgo_secundario_p) REFERENCES rasgosPersonalidad(id_rasgo),
ADD	CONSTRAINT fk_rasgoDomF FOREIGN KEY (rasgo_dominante_f) REFERENCES rasgosfisicos(id_rasgo),
ADD	CONSTRAINT fk_rasgoSecF FOREIGN KEY (rasgo_secundario_f) REFERENCES rasgosfisicos(id_rasgo);

ALTER TABLE companieros 
ADD CONSTRAINT fk_caracteristica_dni_c FOREIGN KEY (dni) REFERENCES caracteristicas(dni);


ALTER TABLE profesores
ADD CONSTRAINT fk_caracteristica_dni_p FOREIGN KEY (dni) REFERENCES caracteristicas(dni)


