-- CREAMOS 2 TABLAS 

CREATE TABLE VENDEDOR(
NUMERO_VENDEDOR INTEGER,
NOMBRE_VENDEDOR VARCHAR2(30),
AREA_VENTAS VARCHAR2(30),
CONSTRAINT PK_NV PRIMARY KEY(NUMERO_VENDEDOR));

CREATE TABLE VENTAS(
ID_VENTAS INTEGER,
MONTO_VENTAS FLOAT,
NUMERO_VENDEDOR INTEGER,
CONSTRAINT PK_VENTAS PRIMARY KEY(ID_VENTAS),
CONSTRAINT FK_NV FOREIGN KEY(NUMERO_VENDEDOR) REFERENCES VENDEDOR(NUMERO_VENDEDOR));

SELECT * FROM VENDEDOR;

SELECT * FROM VENTAS;

--2 PROCEDIMIENTO ALMACENADOS

CREATE OR REPLACE PROCEDURE GUARDAR_VENDEDOR(MI_NV IN INTEGER,MI_NOMBRE IN VARCHAR2,MI_AREA IN VARCHAR2)
AS
BEGIN
INSERT INTO VENDEDOR VALUES(MI_NV, MI_NOMBRE, MI_AREA);
END;
/

CREATE OR REPLACE PROCEDURE GUARDAR_VENTAS(MI_ID IN INTEGER,MI_MONTO IN FLOAT,MI_NV IN INTEGER)
AS
BEGIN
INSERT INTO VENTAS VALUES(MI_ID, MI_MONTO, MI_NV);
END;
/

--ALMACENAMOS EN LAS DOS TABLAS YA CREADAS ANTERIORMENTES
BEGIN
guardar_vendedor(3462,'WATERS','WEST');
guardar_ventas(123,162,3462);
END;
/

SET SERVEROUTPUT ON;

-- CURSOR VENDEDOR

DECLARE
CURSOR CUR_VENDEDOR IS SELECT * FROM VENDEDOR;
BEGIN
-- Para recorrerlo o iterarlo usamos un ciclo FOR
FOR FILA IN CUR_VENDEDOR LOOP
DBMS_OUTPUT.PUT_LINE('La ubicación DEL VENDEDOR ES : '||FILA.NUMERO_VENDEDOR);
END LOOP;
END;
/

--CURSOR VENTAS

DECLARE
CURSOR CUR_VENTAS IS SELECT * FROM VENTAS;
BEGIN
-- Para recorrerlo o iterarlo usamos un ciclo FOR
FOR FILA IN CUR_VENTAS LOOP
DBMS_OUTPUT.PUT_LINE('La ubicación DE LA VENTAS ES : '||FILA.ID_VENTAS);
END LOOP;
END;
/

-- Secuencia

CREATE SEQUENCE SEC_AUTO_INCREMENTO
START WITH 1
INCREMENT BY 1
NOMAXVALUE;

CREATE OR REPLACE PROCEDURE GUARDAR_VENDEDOR(MI_ID,NOM_VEND,AREA_VEND)
AS
BEGIN
SELECT SEC_AUTO_INCREMENTO.NEXTVAL INTO MI_ID FROM DUAL;
INSERT INTO VENDEDOR VALUES(MI_ID,NOM_VEND,AREA_VEND);
END;
/

DECLARE
VALOR INTEGER;
BEGIN
GUARDAR_VENDEDOR(VALOR,'HECTOR',210);
END;
/