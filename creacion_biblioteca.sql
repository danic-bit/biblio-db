
create DATABASE biblioteca;
\c biblioteca

CREATE TABLE socio(
rut_socio CHAR(10) PRIMARY KEY,
nombre_socio VARCHAR(100),
apellido_socio VARCHAR(100),
direccion_socio VARCHAR(255),
telefono_socio VARCHAR(10)
);

CREATE TABLE autor(
codigo_autor INT PRIMARY KEY,
nombre_autor VARCHAR(100),
apellido_autor VARCHAR(100),
fnac_autor DATE,
fdef_autor DATE
);

CREATE TABLE libro(
isbn_libro CHAR(15) PRIMARY KEY,
titulo_libro VARCHAR(255),
paginas_libro INT
);

CREATE TABLE autoria(
isbn_libro CHAR(15),
codigo_autor INT,
tipo_autor VARCHAR(20),
FOREIGN KEY (isbn_libro) REFERENCES libro (isbn_libro),
FOREIGN KEY (codigo_autor) REFERENCES autor (codigo_autor)
);

CREATE TABLE prestamo(
id_prestamo SERIAL PRIMARY KEY,
fecha_prestamo DATE,
fecha_devolucion DATE,
rut_socio CHAR(10),
isbn_libro CHAR(15),
FOREIGN KEY (rut_socio) REFERENCES socio (rut_socio),
FOREIGN KEY (isbn_libro) REFERENCES libro (isbn_libro)
);


-- LLENADO TABLAS


INSERT INTO AUTOR(CODIGO_AUTOR, NOMBRE_AUTOR, APELLIDO_AUTOR, FNAC_AUTOR, FDEF_AUTOR) VALUES(3, 'JOSE', 'SALGADO', '1968-01-01', '01-01-2020');
INSERT INTO AUTOR(CODIGO_AUTOR, NOMBRE_AUTOR, APELLIDO_AUTOR, FNAC_AUTOR, FDEF_AUTOR) VALUES(4, 'ANA', 'SALGADO', '1972-01-01',NULL);
INSERT INTO AUTOR(CODIGO_AUTOR, NOMBRE_AUTOR, APELLIDO_AUTOR, FNAC_AUTOR, FDEF_AUTOR) VALUES(1, 'ANDRES', 'ULLOA', '1982-01-01',NULL);
INSERT INTO AUTOR(CODIGO_AUTOR, NOMBRE_AUTOR, APELLIDO_AUTOR, FNAC_AUTOR, FDEF_AUTOR) VALUES(2, 'SERGIO', 'MARDONES', '1950-01-01','2012-01-01');
INSERT INTO AUTOR(CODIGO_AUTOR, NOMBRE_AUTOR, APELLIDO_AUTOR, FNAC_AUTOR, FDEF_AUTOR) VALUES(5, 'MARTIN', 'PORTA', '1976-01-01',NULL);


INSERT INTO LIBRO(ISBN_LIBRO, TITULO_LIBRO, PAGINAS_LIBRO) VALUES('111-1111111-111', 'CUENTOS DE TERROR', 344);
INSERT INTO LIBRO(ISBN_LIBRO, TITULO_LIBRO, PAGINAS_LIBRO) VALUES('222-2222222-222', 'POESIAS CONTEMPORANEAS', 167);
INSERT INTO LIBRO(ISBN_LIBRO, TITULO_LIBRO, PAGINAS_LIBRO) VALUES('333-3333333-333', 'HISTORIA DE ASIA', 511);
INSERT INTO LIBRO(ISBN_LIBRO, TITULO_LIBRO, PAGINAS_LIBRO) VALUES('444-4444444-444', 'MANUAL DE MECANICA', 298);

INSERT INTO AUTORIA(ISBN_LIBRO, CODIGO_AUTOR, TIPO_AUTOR) VALUES('111-1111111-111', 3, 'PRINCIPAL');
INSERT INTO AUTORIA(ISBN_LIBRO, CODIGO_AUTOR, TIPO_AUTOR) VALUES('111-1111111-111', 4, 'COAUTOR');
INSERT INTO AUTORIA(ISBN_LIBRO, CODIGO_AUTOR, TIPO_AUTOR) VALUES('222-2222222-222', 1, 'PRINCIPAL');
INSERT INTO AUTORIA(ISBN_LIBRO, CODIGO_AUTOR, TIPO_AUTOR) VALUES('333-3333333-333', 2, 'PRINCIPAL');
INSERT INTO AUTORIA(ISBN_LIBRO, CODIGO_AUTOR, TIPO_AUTOR) VALUES('444-4444444-444', 5, 'PRINCIPAL');


INSERT INTO SOCIO(RUT_SOCIO, NOMBRE_SOCIO, APELLIDO_SOCIO, DIRECCION_SOCIO, TELEFONO_SOCIO) VALUES ('1111111-1', 'JUAN', 'SOTO', 'AVENIDA 1, SANTIAGO', '911111111');
INSERT INTO SOCIO(RUT_SOCIO, NOMBRE_SOCIO, APELLIDO_SOCIO, DIRECCION_SOCIO, TELEFONO_SOCIO) VALUES ('2222222-2', 'ANA', 'PEREZ', 'PASAJE 2, SANTIAGO', '922222222');
INSERT INTO SOCIO(RUT_SOCIO, NOMBRE_SOCIO, APELLIDO_SOCIO, DIRECCION_SOCIO, TELEFONO_SOCIO) VALUES ('3333333-3', 'SANDRA', 'AGUILAR', 'AVENIDA 2, SANTIAGO', '933333333');
INSERT INTO SOCIO(RUT_SOCIO, NOMBRE_SOCIO, APELLIDO_SOCIO, DIRECCION_SOCIO, TELEFONO_SOCIO) VALUES ('4444444-4', 'ESTEBAN', 'JEREZ', 'AVENIDA 3, SANTIAGO', '944444444');
INSERT INTO SOCIO(RUT_SOCIO, NOMBRE_SOCIO, APELLIDO_SOCIO, DIRECCION_SOCIO, TELEFONO_SOCIO) VALUES ('5555555-5', 'SILVANA', 'MUNOZ', 'PASAJE 3, SANTIAGO', '955555555');


INSERT INTO PRESTAMO(FECHA_PRESTAMO, FECHA_DEVOLUCION, RUT_SOCIO, ISBN_LIBRO) VALUES('2020-01-20', '2020-01-27', '1111111-1', '111-1111111-111');
INSERT INTO PRESTAMO(FECHA_PRESTAMO, FECHA_DEVOLUCION, RUT_SOCIO, ISBN_LIBRO) VALUES('2020-01-20', '2020-01-30', '5555555-5', '222-2222222-222');
INSERT INTO PRESTAMO(FECHA_PRESTAMO, FECHA_DEVOLUCION, RUT_SOCIO, ISBN_LIBRO) VALUES('2020-01-22', '2020-01-30', '3333333-3', '333-3333333-333');
INSERT INTO PRESTAMO(FECHA_PRESTAMO, FECHA_DEVOLUCION, RUT_SOCIO, ISBN_LIBRO) VALUES('2020-01-23', '2020-01-30', '4444444-4', '444-4444444-444');
INSERT INTO PRESTAMO(FECHA_PRESTAMO, FECHA_DEVOLUCION, RUT_SOCIO, ISBN_LIBRO) VALUES('2020-01-27', '2020-02-04', '2222222-2', '111-1111111-111');
INSERT INTO PRESTAMO(FECHA_PRESTAMO, FECHA_DEVOLUCION, RUT_SOCIO, ISBN_LIBRO) VALUES('2020-01-31', '2020-02-12', '1111111-1', '444-4444444-444');
INSERT INTO PRESTAMO(FECHA_PRESTAMO, FECHA_DEVOLUCION, RUT_SOCIO, ISBN_LIBRO) VALUES( '2020-01-31', '2020-02-12', '3333333-3', '222-2222222-222');
