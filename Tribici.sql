DROP TABLE IF EXISTS usuarios CASCADE;
DROP TABLE IF EXISTS estaciones CASCADE;
DROP TABLE IF EXISTS uso CASCADE;
DROP TABLE IF EXISTS bicicletas CASCADE;

CREATE TABLE usuarios (
	dni varchar(9),
	nombre varchar(100) NOT NULL,
	apellidos varchar (100),
	direccion varchar (100),
	movil varchar(15) NOT NULL,
	email varchar(320) NOT NULL,
	passw varchar(8),
	saldo_disponible numeric NOT NULL DEFAULT 0,
	CONSTRAINT pk_dni PRIMARY KEY (dni),
	CONSTRAINT ck_pass_len CHECK ( LENGTH(passw) BETWEEN 4 AND 8),
	CONSTRAINT ck_pass_blank CHECK ( passw NOT LIKE '% %')
);

CREATE TABLE estaciones (
	cod_estacion varchar,
	num_estacion serial NOT NULL,
	direccion varchar(100) NOT NULL,
	latitud numeric NOT NULL,
	longitud numeric NOT NULL,
	CONSTRAINT pk_estacion PRIMARY KEY (cod_estacion),
	CONSTRAINT ck_cod_estacion CHECK (cod_estacion ILIKE 'E%')
);

CREATE TABLE bicicletas (
	cod_bicicleta serial,
	marca varchar(50) NOT NULL,
	modelo varchar(50) NOT NULL,
	fecha_alta date NOT NULL,
	CONSTRAINT pk_cod_bicicleta PRIMARY KEY (cod_bicicleta)
);

CREATE TABLE uso (
	dni_usuario varchar(9),
	estacion_salida varchar,
	fecha_salida timestamp,	
	cod_bicicleta integer,
	estacion_llegada varchar,
	fecha_llegada timestamp NOT NULL,
	CONSTRAINT pk_est_salida_fecha_salida_dni_usuario_cod_bici_est_llegada
		PRIMARY KEY (estacion_salida, fecha_salida, dni_usuario, cod_bicicleta, estacion_llegada)
);

ALTER TABLE uso
	ADD CONSTRAINT fk_dni FOREIGN KEY (dni_usuario) REFERENCES usuarios(dni),
	ADD CONSTRAINT fk_cod_bicicleta FOREIGN KEY (cod_bicicleta) REFERENCES bicicletas,
	ADD CONSTRAINT fk_cod_estacion_llegada FOREIGN KEY (estacion_llegada) REFERENCES estaciones(cod_estacion),
	ADD CONSTRAINT fk_cod_estacion_salida FOREIGN KEY (estacion_salida) REFERENCES estaciones(cod_estacion);

--INSERCION DE DATOS

INSERT INTO usuarios VALUES ('12345678A', 'Roberto', 'Carvajal Velasco', 'C/ Condes de Bustillo 9',
							'+34 123456789', 'robertocarvajalvelasco@gmail.com', '12345', 134534),
							('12345678B', 'Pablo', 'Ruiz Salado', 'C/ Camino de Mejina 13',
							'+34 123456789', 'pabloruizsalado@gmail.com', '12345', 152342),
							('12345678C', 'Alvaro', 'Pagés', 'C/ Ruiseñor 5',
							'+34 123456789', 'alvaropages@gmail.com', '12345', 134534);

INSERT INTO estaciones VALUES ('E2314', '1', 'C/ Lopez de Gomara 5', '37.380800', '-6.009023'),
							  ('E2313', '2', 'C/ San Jacinto 8', '37.384027', '-6.004642'),
							  ('E2312', '3', 'C/ Evangelista 61', '37.380086', '-6.006253'),
							  ('E2311', '4', 'C/ Esperanza de Triana 19', '37.381393', '-6.006624'),
							  ('E2310', '5', 'Parque de los Principes', '37.375846', '-6.005768'),
							  ('E2309', '6', 'C/ San Vicente de Paul', '37.383576', '-6.010422'),
							  ('E2308', '7', 'C/ Betis', '37.384949', '-6.001871');
							  
INSERT INTO bicicletas (marca, modelo, fecha_alta) VALUES ('Xiaomi', 'Qicycle', '18/02/2021'::date),
														  ('Xiaomi', 'Mi Smart', '12/05/2021'::date),
														  ('Windgoo', 'E-version', '18/01/2022'::date),
														  ('Moma', 'E-MTB Fatbike', '18/08/2020'::date),
														  ('Gunai', 'Snow-E', '23/02/2019'::date),
														  ('Accolmile', 'Cola Bear', '14/01/2022'::date),
														  ('Vivi', 'E-Mountain', '19/09/2021'::date),
														  ('Nilox', 'X2', '18/10/2018'::date);
INSERT INTO uso VALUES ('12345678A', 'E2314', '15/01/2022 18:04'::timestamp, '4', 'E2312', '15/01/2022 19:03'::timestamp),
						('12345678B', 'E2312', '13/01/2022 15:16'::timestamp, '2', 'E2312', '13/01/2022 23:14'::timestamp),
						('12345678B', 'E2314', '18/01/2022 13:04'::timestamp, '5', 'E2311', '18/01/2022 14:59'::timestamp);

--MODIFICACION RELACION USUARIO

ALTER TABLE usuarios 
	ADD COLUMN fecha_baja date;

--INSERCION NUEVOS DATOS

INSERT INTO uso VALUES ('12345678B', 'E2313', '11/02/2020 13:35'::timestamp, '8', 'E2310', '11/02/2020 13:43'::timestamp),
					   ('12345678A', 'E2308', '11/02/2020 12:00'::timestamp, '6', 'E2309', '11/02/2020 12:15'::timestamp),
					   ('12345678B', 'E2309', '10/02/2020 9:12'::timestamp, '3', 'E2308', '10/02/2020 9:21'::timestamp),
					   ('12345678A', 'E2308', '18/01/2022 8:45'::timestamp, '1', 'E2309', '18/01/22 8:53'::timestamp);

INSERT INTO estaciones VALUES ('E201000003', '8', 'C/ Lopez de Gomara', '37.7880814', '-5.9985352');
					   


-- CosteAcumulado
	