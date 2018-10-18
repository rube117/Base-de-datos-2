-- 3) Efectuar el Select en almac�n
SELECT * FROM ALMACEN;

SET SERVEROUTPUT ON;

/* Aqu� reposa el procedure IMPRIMIR
CREATE OR REPLACE PROCEDURE IMPRIMIR(MENSA IN VARCHAR2)
AS
BEGIN
DBMS_OUTPUT.PUT_LINE(MENSA);
END;
/
*/
-- Cursor Explicito para iterar la tabla Almacen
DECLARE
CURSOR CUR_ALMACEN IS SELECT * FROM ALMACEN;
BEGIN
-- Para recorrerlo o iterarlo usamos un ciclo FOR
FOR FILA IN CUR_ALMACEN LOOP
IMPRIMIR('La ubicaci�n del almac�n es: '||FILA.UBICACION_ALMACEN);
END LOOP;
END;
/

-- Ejercicio N�mero 2
DECLARE
CURSOR CUR_ALMACEN IS SELECT * FROM ALMACEN FOR UPDATE;
BEGIN
FOR FILA IN CUR_ALMACEN LOOP
IMPRIMIR('Ubicaci�n actual: '||FILA.UBICACION_ALMACEN);
UPDATE ALMACEN SET UBICACION_ALMACEN
=FILA.UBICACION_ALMACEN||',ECATERROR' WHERE CURRENT OF CUR_ALMACEN;
END LOOP;
END;
/

SELECT * FROM ALMACEN;

-- Ejercicio 3
DECLARE
CURSOR CUR_ALMACEN IS SELECT * FROM ALMACEN FOR UPDATE;
BEGIN
  FOR FILA IN CUR_ALMACEN LOOP
  IMPRIMIR('Ubicaci�n actual: '||FILA.UBICACION_ALMACEN);
  -- Checamos el n�mero del almac�n
    IF FILA.NUMERO_ALMACEN <=2 THEN
    UPDATE ALMACEN SET UBICACION_ALMACEN ='NEZAYORK' WHERE CURRENT OF CUR_ALMACEN;
    END IF;
  END LOOP;
END;
/

SELECT * FROM ALMACEN;

-- Ejercicio 4
DECLARE
CURSOR CUR_ALMACEN IS SELECT * FROM ALMACEN FOR UPDATE;
CURSOR CUR_CLIENTE IS SELECT * FROM CLIENTE FOR UPDATE;
BEGIN
  FOR FILA IN CUR_ALMACEN LOOP
    IF (FILA.UBICACION_ALMACEN == 'NEZAYORK') THEN
    imprimir('Los nombres que compraron son: '||FILA.UBICACION_ALMACEN);
    END IF;
  END LOOP;
END;
/
