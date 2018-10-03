--Mi primer programa bloque PL-SQL: ¡HolaMundo!
--Modo de depuración 
SET SERVEROUTPUT ON;

BEGIN
--Aquí va la lógica
DBMS_OUTPUT.PUT_LINE('Hola Mundo');
END;
/

-- Segundo bloque PL-SQL usando declaración de variables

DECLARE

EDAD INTEGER;
NOMBRE VARCHAR2(40);
DIAS INTEGER;

BEGIN
-- Asignamos esas variables
EDAD:=20;
-- Sacamos tu edad en días
DIAS:=EDAD*365;
NOMBRE:='Rubén';

DBMS_OUTPUT.PUT_LINE('Buenos días '||NOMBRE||'. Tu edad en días: '||DIAS);

END;
/



-- Tercer bloque PL-SQL
--Paso 1: Crear tablas con los nombres Chicos y Grandes.
CREATE TABLE Chicos(ID INTEGER PRIMARY KEY,Valor INTEGER);
CREATE TABLE Grandes(ID INTEGER PRIMARY KEY,Valor INTEGER);

/*Paso 2: Generar un bloque PL-SQL que tengan declarada una variable de integer que se llame edad 
y que al asignar un valor mayor a 18, inserte dicha edad en el campo valor de la tabla Grandes.
*/
DECLARE
EDAD INTEGER;

BEGIN
EDAD:=10;
IF EDAD >18 THEN
INSERT INTO GRANDES VALUES(2,EDAD);
ELSE
INSERT INTO CHICOS VALUES(2,EDAD);
END IF;
END;
/

--Lo probamos
SELECT * FROM Grandes;
SELECT * FROM Chicos;

