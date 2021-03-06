/* ***************************
-- ***** Esquema_Almacen *****
   ***************************
*/
-- Creamos la tabla almac�n
CREATE TABLE ALMACEN(NUMERO_ALMACEN INTEGER,
UBICACION_ALMACEN VARCHAR2(50),
CONSTRAINT PK_NUM_ALMACEN PRIMARY KEY(NUMERO_ALMACEN));

-- Creamos la tabla cliente que se relaciona a almac�n
CREATE TABLE CLIENTE(NUMERO_CLIENTE INTEGER,
NUMERO_ALMACEN INTEGER, NOMBRE_CLIENTE VARCHAR2(50),
CONSTRAINT PK_NUM_CLIENTE PRIMARY KEY(NUMERO_CLIENTE),
CONSTRAINT FK1_NUM_ALMACEN FOREIGN KEY(NUMERO_ALMACEN) REFERENCES ALMACEN(NUMERO_ALMACEN));

-- Procedimiento GUARDAR_ALMACEN
CREATE OR REPLACE PROCEDURE GUARDAR_ALMACEN(MI_ID IN INTEGER,MI_UBI IN VARCHAR2)
AS
BEGIN
INSERT INTO ALMACEN VALUES(MI_ID, MI_UBI);
END;
/

-- Procedimiento Guardar_Cliente
CREATE OR REPLACE PROCEDURE GUARDAR_CLIENTE(MI_ID IN INTEGER,
ID_ALMACEN IN INTEGER, NOM_CLIENTE IN VARCHAR2)
AS
BEGIN
INSERT INTO CLIENTE VALUES(MI_ID, ID_ALMACEN, NOM_CLIENTE);
END;
/

/* ****************************
-- ***** Esquema_Vendedor *****
   ****************************
*/

CREATE TABLE VENDEDOR(
NUMERO_VENDEDOR INTEGER,
NOMBRE_VENDEDOR VARCHAR2(60),
AREA_VENTAS VARCHAR2(40),
CONSTRAINT PK_NV PRIMARY KEY(NUMERO_VENDEDOR));

CREATE TABLE VENTAS(
ID_VENTAS INTEGER,
NUMERO_CLIENTE INTEGER,
NUMERO_VENDEDOR INTEGER,
MONTO_VENTAS FLOAT,
CONSTRAINT PK_ID PRIMARY KEY(ID_VENTAS),
CONSTRAINT FK_NC1 FOREIGN KEY(NUMERO_CLIENTE) REFERENCES CLIENTE(NUMERO_CLIENTE),
CONSTRAINT FK_NV1 FOREIGN KEY(NUMERO_VENDEDOR) REFERENCES VENDEDOR(NUMERO_VENDEDOR)
);

-- Secuencia para auto-incrementar Ventas
CREATE SEQUENCE SEC_AUTO_INCREMENTO
START WITH 1
INCREMENT BY 1
NOMAXVALUE;

-- Procedimiento Guardar_Vendedor
CREATE OR REPLACE PROCEDURE GUARDAR_VENDEDOR(MI_ID IN INTEGER,
NOMBRE_V IN VARCHAR2, AREA_V IN VARCHAR2)
AS
BEGIN
INSERT INTO VENDEDOR VALUES(MI_ID, NOMBRE_V, AREA_V);
END;
/

-- Procedimiento Guardar_Ventas
CREATE OR REPLACE PROCEDURE GUARDAR_VENTAS(MI_ID OUT INTEGER,
NUMERO_C IN INTEGER, NUMERO_V IN INTEGER, MONTO IN FLOAT)
AS 
BEGIN
SELECT SEC_AUTO_INCREMENTO.NEXTVAL INTO MI_ID FROM DUAL;
INSERT INTO VENTAS VALUES(MI_ID, NUMERO_C, NUMERO_V,MONTO);
END;
/