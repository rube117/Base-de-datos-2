-- Primero los almacenes

BEGIN
GUARDAR_ALMACEN(1,'PLYMOUTH');
GUARDAR_ALMACEN(2,'SUPERIOR');
GUARDAR_ALMACEN(3,'BISMARCK');
GUARDAR_ALMACEN(4,'FARGO');
END;
/

SELECT * FROM ALMACEN;

-- Guardamos la información en la tabla Vendedor
BEGIN
guardar_vendedor(3462,'WATERS','WEST');
guardar_vendedor(3593,'DRYNE','EAST');
END;
/

SELECT * FROM VENDEDOR;