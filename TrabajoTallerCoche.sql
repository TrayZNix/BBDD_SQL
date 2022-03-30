DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS empleados;
DROP TABLE IF EXISTS proveedores;
DROP TABLE IF EXISTS puestos;
DROP TABLE IF EXISTS pedidos;
DROP TABLE IF EXISTS coches;
DROP TABLE IF EXISTS servicios;
DROP TABLE IF EXISTS facturas;

CREATE TABLE puestos (
 	id_puesto 		smallserial,
	nombre_Puesto   varchar(50),
	CONSTRAINT pk_id_puesto PRIMARY KEY (id_puesto)
);

CREATE TABLE clientes (
	id_cliente		serial,
	nombre 			varchar(100),
	apellidos		varchar (100),
	dni_cliente 	varchar(9),
	direccion 		varchar(150),
	IBAN 			varchar(40),
	CONSTRAINT pk_id_cliente PRIMARY KEY (id_cliente)
);

CREATE TABLE 
