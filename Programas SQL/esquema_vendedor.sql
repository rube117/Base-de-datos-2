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
CREATE SEQUENCE SEC_VENTAS
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
SELECT SEC_VENTAS.NEXTVAL INTO MI_ID FROM DUAL;
INSERT INTO VENTAS VALUES(MI_ID, NUMERO_C, NUMERO_V,MONTO);
END;
/